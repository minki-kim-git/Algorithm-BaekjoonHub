let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = [Int]()
for _ in 0..<n[1]{
    let input = Int(readLine()!)!
    arr.append(input)
}
arr.sort(by: >)
var ans = 0
var num = 0
for i in 0..<arr.count {
    guard i < n[0] else { break }
    if arr[i] * (i + 1) >= ans {
        ans = arr[i] * (i + 1)
        num = arr[i]
    }
}
print(num,ans)