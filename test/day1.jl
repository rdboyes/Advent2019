@test day1_1([12]) == 2
@test day1_1([14]) == 2
@test day1_1([1969]) == 654
@test day1_1([100756]) == 33583
@test day1_1([12, 14, 1969, 100756]) == 2 + 2 + 654 + 33583

@test day1_2([14]) == 2
@test day1_2([1969]) == 966
@test day1_2([100756]) == 50346

d1data = read_day1("../data/1.txt")
@test day1_1(d1data) == 3299598
@test day1_2(d1data) == 4946546