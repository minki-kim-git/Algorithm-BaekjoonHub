var dic = [Int:Bool]()
var ans = 0
let n = Int(readLine()!)!
let m = Int(readLine()!)!
let _ = readLine()!.split(separator: " ").map {
    dic[Int(String($0))!] = true
}
for i in dic{
    if dic[m - i.key] != nil{
        ans += 1
    }
}
print(ans/2)