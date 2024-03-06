var ans = 0
let n = readLine()!.split(separator: " ").map { Int(String($0))! }
var index = 1...n[1]
let count = Int(readLine()!)!
for _ in 0..<count{
    let input = Int(readLine()!)!
    guard !index.contains(input) else { continue }
    if input > index.upperBound {
        ans += input-index.upperBound
        index = input-n[1]+1...input
    } else {
        ans += index.lowerBound-input
        index = input...input+n[1]-1
    }
}
print(ans)