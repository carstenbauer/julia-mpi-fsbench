if length(ARGS) == 0
    println("Please provide job output file or folder containing those files as argument.")
    exit()
end

function get_min_time_str(jobfile)
    lines_with_times = filter(startswith("real"), readlines(jobfile))
    time_strs = getindex.(split.(lines_with_times, '\t'), 2)
    time_strs = time_strs[2:end] # drop first time

    tmp = split.(time_strs, 'm')
    minutes = parse.(Float64, getindex.(tmp, 1))
    seconds = parse.(Float64, getindex.(split.(getindex.(tmp, 2), 's'), 1))
    times_in_secs = minutes .* 60 .+ seconds
    minidx = findmin(times_in_secs)[2]
    return time_strs[minidx]
end

jobarg = first(ARGS)
if isfile(jobarg)
    jobfile = jobarg
    println(get_min_time_str(jobfile))
elseif isdir(jobarg)
    cd(jobarg) do
        jobfiles = filter(endswith(".out"), readdir())
        for jf in jobfiles
            println("Job: ", jf)
            println(get_min_time_str(jf))
        end
    end
end
