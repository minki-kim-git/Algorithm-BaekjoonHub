var dic = [Int:Int]()
var dx = [-1,1]

let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var s = readLine()!.split(separator: " ").map{Int(String($0))!}
_ = readLine()!.split(separator: " ").map{
    dic[Int(String($0))!] = 1
}

var ans = n[1]

for i in 0..<s.count {
    if let val = dic[s[i]] {
        if val == 1 {
            dic[s[i]] = 0
            s[i] = -1
            ans -= 1
        }
    }
}

for i in s {
    for j in 0..<2 {
        let num = dx[j] + i
        if let val = dic[num] {
            if val == 1 {
                dic[num] = 0
                ans -= 1
                break
            }
        }
    }
}

print(ans)