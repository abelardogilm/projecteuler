limit, x, y = [1000, 3, 5]
p (1..limit-1).inject(0){|sum,item| sum + (item % x == 0 || item % y == 0 ? item : 0)}

