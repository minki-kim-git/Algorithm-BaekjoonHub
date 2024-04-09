let n = Int(readLine()!)!
var dic = [String:Bool]()
var count = 0
for _ in 0..<n {
    var input = readLine()!
    for _ in 0..<input.count{
        let str = String(input.popLast()!)
        input = str + input
        if dic[input] != nil{
            count = 1
            break
        }
    }
    if count != 1 {
        dic[input] = true
    }
    count = 0
}
print(dic.count)