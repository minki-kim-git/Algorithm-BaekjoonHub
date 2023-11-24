let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = readLine()!.split(separator: " ").map{Int(String($0))!}
let b = readLine()!.split(separator: " ").map{Int(String($0))!}
var dic = [Int: Bool]()
var count = 0
for i in a{
    dic[i] = true
}
for j in b {
    if let _ = dic[j] {
        count += 1
    }
}
print((n[0] + n[1]) - (count*2))
