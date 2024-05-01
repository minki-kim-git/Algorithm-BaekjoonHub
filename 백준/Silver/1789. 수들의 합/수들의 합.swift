let s = Int(readLine()!)!
var ans = 0
var sum = 0
while sum < s {
    ans += 1
    sum += ans
}
if sum > s {
    print(ans-1)
} else {
    print(ans)
}