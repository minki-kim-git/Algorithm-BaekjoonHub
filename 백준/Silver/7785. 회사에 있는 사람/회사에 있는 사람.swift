let n = Int(readLine()!)!
var arr = [String]()
var dic = [String:Bool]()
for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{String($0)}
    if let value = dic[input[0]]{
        dic[input[0]] = value == true ? false : true
    } else {
        dic[input[0]] = true
    }
}
let _ = dic.map { key, value in
    if value == true {
        arr.append(key)
    }
}
var ans = arr.sorted()
for i in 0..<ans.count{
    print(ans[ans.count - 1 - i])
}