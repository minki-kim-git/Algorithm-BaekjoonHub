let n = Int(readLine()!)!
var dic = [String:Bool]()
var arr = [String]()
for _ in 0..<n {
    let input = readLine()!
    arr.append(input)
}
var ans = 1
while ans < arr[0].count {
    for i in arr {
        let num = i.suffix(ans)
        if let _ = dic[String(num)] {
            break
        } else {
            dic[String(num)] = true
        }
    }
    if dic.count == n {
        break
    }
    dic.removeAll()
    ans += 1 
}
print(ans)