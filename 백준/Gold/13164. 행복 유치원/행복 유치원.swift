let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var arr = [Int]()
var num = input.first!
for i in 1..<input.count {
    arr.append(input[i]-num)
    num = input[i]
}
arr = arr.sorted()
var ans = 0
for _ in 0..<n[1]-1 {
    arr.removeLast()
    guard !arr.isEmpty else { break }
}
print(arr.reduce(0,+))