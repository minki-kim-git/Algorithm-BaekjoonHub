let n = Int(readLine()!)!
let input = readLine()!.map{$0}

var st = 0
var en = 0
var ans = 0

var dic = [Character:Int]()

while en < input.count || dic.count > n {
    if dic.count <= n {
        if let val = dic[input[en]] {
            dic[input[en]] = val + 1
        } else {
            dic[input[en]] = 1
        }
        en += 1
    } else {
        if let val = dic[input[st]] {
            dic[input[st]] = val - 1
            if dic[input[st]] == 0 {
                dic[input[st]] = nil
            }
        } else {
            dic[input[st]] = 1
        }
        st += 1
    }
    if dic.count <= n && ans < en - st {
        ans = en - st
    }
}
print(ans)