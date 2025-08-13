## "Brute force"

function check(num::Int64; condition=(i, d) -> true)
    d = digits(num)
    doubles = 0
    for i in 2:6
        if d[i] > d[i-1]
            return 0
        elseif d[i] == d[i-1]
            if condition(i, d)
                doubles += 1
            end
        end
    end

    doubles > 0 && return 1
    return 0
end

double_not_triple(i, d) = (i == 2 || d[i] != d[i-2]) && (i == 6 || d[i+1] != d[i])
check.(264793:803935) |> sum |> println
check.(264793:803935; condition=double_not_triple) |> sum |> print

# single line to solve both parts
[(n -> n |> digits |> diff |> (x -> !any(x .> 0) && f(x))).(264793:803935) |> sum
 for f in [
    x -> !all(x .!= 0),
    x -> any([x[i] == 0 && (i == 1 || x[i-1] != 0) && (i == 5 || x[i+1] != 0) for i in 1:5])
]]
