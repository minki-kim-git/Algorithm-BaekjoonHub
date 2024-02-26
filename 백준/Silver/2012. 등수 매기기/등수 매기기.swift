let n = Int(readLine()!)!
var arr = [Int]()
var ans = 0
for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}
arr.sort()
for i in 1...n{
    if i != arr[i-1] {
       ans += abs(i - arr[i-1])
    }
}
print(ans)