using Pkg

mode = lowercase(get(ARGS, 1, "create"))

JLDEPOT_HOME = joinpath(ENV["HOME"], ".julia_fsbench")
JLDEPOT_PC2PFS = joinpath(ENV["PC2PFS"], "pc2-mitarbeiter", "bauerc", ".julia_fsbench")

for depot in (JLDEPOT_HOME, JLDEPOT_PC2PFS)
    if mode in ("remove", "delete")
        println("Deleting Julia depot at ", depot)
        rm(depot; force=true, recursive=true)
    else
        if isdir(depot)
            println("Julia depot at ", depot, " is already present. Please delete first.")
            continue
        end
        println("Creating Julia depot at ", depot)
        DEPOT_PATH[1] = depot
        Pkg.activate(@__DIR__)
        Pkg.instantiate()
        println("\n")
    end
end