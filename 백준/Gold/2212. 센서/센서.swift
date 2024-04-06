let n = Int(readLine()!)!
let k = Int(readLine()!)!
var set = Set<Int>()
let input = readLine()!.split(separator: " ").map {
    set.insert(Int(String($0))!)
}
var arr = set.sorted(by: >)
var num = arr.first!
var minArr = [Int]()
for i in 1..<arr.count {
    minArr.append(num - arr[i])
    num = arr[i]
}
minArr = minArr.sorted()
for _ in 0..<k-1 {
    if !minArr.isEmpty {
        minArr.removeLast()
    }
    guard !minArr.isEmpty else { break }
}
print(minArr.reduce(0, +))