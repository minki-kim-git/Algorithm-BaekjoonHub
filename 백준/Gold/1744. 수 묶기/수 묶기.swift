var ans = 0
var positiveArr = [Int]()
var negativeArr = [Int]()
let n = Int(readLine()!)!
for _ in 0..<n{
    let input = Int(readLine()!)!
    if input > 0 {
        positiveArr.append(input)
    } else {
        negativeArr.append(input)
    }
}
positiveArr = positiveArr.sorted(by:>)
negativeArr = negativeArr.sorted(by:<)
var num = 0
for i in 0..<positiveArr.count{
    guard positiveArr[i] != 1 else {
        ans += 1
        continue
    }
    if num == 0 {
        num = positiveArr[i]
        continue
    }
    ans += num * positiveArr[i]
    num = 0
}
if num != 0 {
    ans += num
    num = 0
}
for i in 0..<negativeArr.count{
    if num == 0 {
        num = negativeArr[i]
        continue
    }
    ans += num * negativeArr[i]
    num = 0
}
if num != 0 {
    ans += negativeArr.last!
}
print(ans)