let n = readLine()!.split(separator: " ").map{Int(String($0))}
var dic = [String:String]()
for _ in 0..<n[0]!{
    let input = readLine()!.split(separator: " ")
    dic[String(input[0])] = String(input[1])
}
for _ in 0..<n[1]!{
    let input = readLine()!
    print(dic[input]!)
}