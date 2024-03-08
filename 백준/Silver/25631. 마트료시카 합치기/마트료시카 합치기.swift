var ans = 0
var dic = [Int:Int]()
let _ = Int(readLine()!)!
let _ = readLine()!.split(separator: " ").map {
    if let val = dic[Int(String($0))!] {
        dic[Int(String($0))!] = 1 + val
    } else {
        dic[Int(String($0))!] = 1
    }
}
var arr = dic.sorted(by: >)
while arr.filter({ $0.value != 0
}).count > 0 {
    for i in 0..<arr.count{
        if arr[i].value > 0 {
            arr[i].value -= 1
        }
    }
    ans += 1
}
print(ans)