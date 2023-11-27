let n = Int(readLine()!)!
var dic = [String:Bool]()
for _ in 0..<n{
    var input = readLine()!.split(separator: " ").map{String($0)}
    if input.contains("ChongChong"){
        input.remove(at:input.firstIndex(of: "ChongChong")!)
        dic["ChongChong"] = true
        dic[input[0]] = true
    } else {
        if dic[input[0]] != nil {
            dic[input[1]] = true
        } else if dic[input[1]] != nil{
            dic[input[0]] = true
        }
    }
}
print(dic.count)