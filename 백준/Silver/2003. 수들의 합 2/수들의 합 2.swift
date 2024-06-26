let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var sum = 0
var st = 0
var en = 0
var ans = 0
while st < n[0] {
    if st == en {
        sum = input[st]
    }
    if sum < n[1] {
        en += 1
        if en == n[0] { break }
        sum += input[en]
    } else if sum >= n[1] {
        if sum == n[1] {
            ans += 1
        }
        sum -= input[st]
        st += 1
    }
}
print(ans)