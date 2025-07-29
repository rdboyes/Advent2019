function read_day1(filename::String)
    return parse.(Int, readlines(filename))
end

function day1_1(xs::Vector{Int64})
    return sum([x ÷ 3 - 2 for x in xs])
end

