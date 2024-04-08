var arr = [Int]()
var ans = 2000
let a = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = Int(readLine()!)!
for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}
for i in arr {
    ans = min(ans, abs(i-a[1]))
}
if abs(a[0]-a[1]) < ans+1 {
    print(abs(a[0]-a[1]))
} else {
    print(ans+1)
}