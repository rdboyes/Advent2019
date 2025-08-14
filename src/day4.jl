## "Brute force"
# weird stuff: digits gives the digits in reverse order to what I expected
# .|> (broadcasted pipe) does not work at all? (edit: need tuple)
# conditionals short circuit - the "double_not_triple" function does not give an oob

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

# alternate
[(n -> n |> digits |> diff |> (x -> !any(x .> 0) && f(x))).(264793:803935) |> sum
 for f in [
    x -> !all(x .!= 0),
    x -> any(
        [x[i] == 0 &&
             (i == 1 || x[i-1] != 0) &&
             (i == 5 || x[i+1] != 0) for i in 1:5]
    )
]]

# alt alt

solve(n) = ((digits(n),) .|> [
               x -> length(unique(x)) < 6,
               y -> all(diff(y) .<= 0),
               z -> any([v == 2 for (k, v) in StatsBase.countmap(z)])
           ],) .|>
           [a -> a[1] && a[2], all]

sum(hcat(solve.(264793:803935)..., 2)
