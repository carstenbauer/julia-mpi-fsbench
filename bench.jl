using MPI
using StaticArrays
using Random

const MAX_HOSTNAME_LENGTH = 15
const VERBOSE = lowercase(get(ARGS, 1, "")) == "verbose"

MPI.Init()

comm = MPI.COMM_WORLD
rank = MPI.Comm_rank(comm)
size = MPI.Comm_size(comm)
root = 0
if VERBOSE
    hn = collect(first(split(gethostname(), '.')))
    if length(hn) > MAX_HOSTNAME_LENGTH
        error("Hostname too long ($(gethostname())). Increase MAX_HOSTNAME_LENGTH.")
    else
        while length(hn) < MAX_HOSTNAME_LENGTH
            push!(hn, ' ')
        end
    end
    hn_static = convert(SVector{MAX_HOSTNAME_LENGTH}, hn)
    hns_static = MPI.Gather(hn_static, root, comm)
    if rank == root
        for (i, range) in enumerate(Iterators.partition(1:length(hns_static), MAX_HOSTNAME_LENGTH))
            host = strip(join(hns_static[range]))
            println("Rank $(i-1) running on host $(host)")
        end
    end
end

asize = 5000

if rank == root
    Random.seed!(42)
    data = rand([0, 1], asize, asize)
else
    data = Matrix{Int}(undef, asize, asize)
end

# broadcast random matrix to all ranks
MPI.Bcast!(data, root, comm)

# now do scalar multiply by rank number
# and find the matrix maximum
data_mult = data * rank
data_max = maximum(data_mult)

# gather our results back to rank 0
# gather_data = Vector{Int}(undef, size)
gather_data = MPI.Gather(data_max, root, comm)

# check that our results are correct
if rank == root
    # adjust for zero indexing
    asize = size - 1
    max_gather = maximum(gather_data)
    @assert asize == max_gather
    VERBOSE && println("Result: ", max_gather)
end

MPI.Finalize()