let n = Int(readLine()!)!
var arr = [Int]()
var ans = 0
for _ in 0..<n{
    let input = Int(readLine()!)!
    arr.append(input)
}
arr.sort(by: >)
for i in 0..<arr.count {
    if (i+1) % 3 != 0 {
        ans += arr[i]
    }
}
print(ans)