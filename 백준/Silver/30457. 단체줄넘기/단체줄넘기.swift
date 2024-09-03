let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = n
var dic = [Int:Int]()

for i in arr {
    if let val = dic[i] {
        dic[i] = 1 + val
        if val >= 2 {
            ans -= 1
        }
    } else {
        dic[i] = 1
    }
}

print(ans)