var dic = [String:Int]()
var ans = ""
let _ = Int(readLine()!)!
let _ = readLine()!.split(separator: " ").map {
    if let val = dic[String($0)] {
        dic[String($0)] = val + 1
    } else {
        dic[String($0)] = 1
    }
}
let _ = Int(readLine()!)!
let _ = readLine()!.split(separator: " ").map {
    if dic[String($0)] == nil {
        ans += "0 "
    } else {
        ans += "\(dic[String($0)]!) "
    }
}
ans.removeLast()
print(ans)