let n = Int(readLine()!)!
var arr = [Int]()
var ans = 0
var stackArr = [Int]()
for i in 0..<n{
    let input = Int(readLine()!)!
    if i == 0 { stackArr.append(input) }
    while stackArr.count > 0 {
        if stackArr.last! > input {
            ans += stackArr.count
            stackArr.append(input)
            break
        } else {
            stackArr.removeLast()
            if stackArr.isEmpty {
                stackArr.append(input)
                break
            }
        }
    }
}
print(ans)