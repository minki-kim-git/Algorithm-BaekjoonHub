let n = Int(readLine()!)!
var dic = [String:Bool]()
var ans = 0
for _ in 0..<n{
    let input = readLine()!
    if input == "ENTER" {
        dic.removeAll()
    } else {
        if dic[input] == nil {
            ans += 1
        }
        dic[input] = true
    }
}
print(ans)
