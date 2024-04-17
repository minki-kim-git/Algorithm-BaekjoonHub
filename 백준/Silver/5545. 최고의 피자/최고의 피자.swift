var arr = [Int]()
var num = 0
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map{Int(String($0))!}
let c = Int(readLine()!)!
var ans = c / a[0]
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr = arr.sorted(by: >)
for i in 0..<arr.count {
    num += arr[i]
    ans = max((c+num)/(a[0]+(a[1]*(i+1))),ans)
}
print(ans)