let n = Int(readLine()!)!
var arr = [Int]()
var max = 0
for _ in 0..<n{
    let input = Int(readLine()!)!
    arr.append(input)
}
arr.sort(by:>)
for i in 1...n{
    max = arr[i-1]-(i-1) > 0 ? max + arr[i-1]-(i-1): max
}
print(max)