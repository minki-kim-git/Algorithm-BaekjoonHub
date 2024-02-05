let n = Int(readLine()!)!
var dic = [String:Int]()
for _ in 0..<n{
    let input = readLine()!
    if let val = dic[input] {
        dic[input] = val + 1
    } else {
        dic[input] = 1
    }
}
for _ in 0..<n-1{
    let input = readLine()!
    if let val = dic[input] {
      dic[input] = val - 1
    }
}
print(dic.filter { $0.value == 1 }.keys.first!)