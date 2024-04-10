var dic = [Int:Bool]()
let n = Int(readLine()!)!
let _ = readLine()!.split(separator: " ").map{
    dic[Int(String($0))!] = true
}
let x = Int(readLine()!)!
var count = 0
for i in dic {
    if dic[x-i.key] == true {
        count += 1
    }
}
print(count/2)