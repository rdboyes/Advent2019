read_day1(filename::String) = parse.(Int, readlines(filename))
"""
Fuel required to launch a given module is based on its mass. Specifically, to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.

The Fuel Counter-Upper needs to know the total fuel requirement. To find it, individually calculate the fuel needed for the mass of each module (your puzzle input), then add together all the fuel values.

What is the sum of the fuel requirements for all of the modules on your spacecraft?
"""
day1_1(xs::Vector{Int64}) = sum(p1fuel.(xs))
p1fuel(m::Int64) = m ÷ 3 - 2
"""
Fuel itself requires fuel just like a module - take its mass, divide by three, round down, and subtract 2. However, that fuel also requires fuel, and that fuel requires fuel, and so on. Any mass that would require negative fuel should instead be treated as if it requires zero fuel.
"""
day1_2(xs::Vector{Int64}) = sum(p2fuel.(xs))
p2fuel(m::Int64) = m < 0 ? 0 : max(0, p1fuel(m)) + p2fuel(p1fuel(m))