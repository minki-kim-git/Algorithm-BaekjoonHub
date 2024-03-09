var dic = [Int:Bool]()
let n = readLine()!.split(separator:" ").map { Int(String($0))! }
let _ = readLine()!.split(separator:" ").map { dic[Int(String($0))!] = true }
var ans = 0
var length = 0
for i in dic.keys.min()!...dic.keys.max()!{
    if length != 0 {
        length -= 1
    }
    if dic[i] != nil {
        if length == 0 {
            ans += 1
            length = n[1]
        }
    }
}
print(ans)