var dic = [Int:Bool]()
var count = 5
var ans = 4
let n = Int(readLine()!)!
for _ in 0..<n{
    let input = Int(readLine()!)!
    dic[input] = false
}
for i in dic {
    for j in i.key..<i.key+5{
        if dic[j] != nil{
            count -= 1
        }
    }
    ans = min(ans,count)
    count = 5
}
print(ans)