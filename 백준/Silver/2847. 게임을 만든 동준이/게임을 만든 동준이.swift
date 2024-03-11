let n = Int(readLine()!)!
var arr = [Int]()
var ans = 0
for _ in 0..<n{
    let input = Int(readLine()!)!
    arr.append(input)
}
arr.reverse()
var num = arr.first!
for i in 1..<arr.count{
    if num < arr[i] {
        ans += arr[i] - num + 1
        num -= 1
    } else if num == arr[i] {
        num -= 1
        ans += 1
    } else {
        num = arr[i]
    }
}
print(ans)