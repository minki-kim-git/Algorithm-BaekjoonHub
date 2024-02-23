let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var h = readLine()!.split(separator: " ").map{Int(String($0))!}
h.sort(by: <)
var ans = n[1]
for i in h{
    if i <= ans {
        ans += 1
    } else {
        break
    }
}
print(ans)
