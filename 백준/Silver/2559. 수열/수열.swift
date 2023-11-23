let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var index = 0
var ans = -1000
var num = 0
for i in 0..<arr.count{
    index += 1
    num += arr[i]
    if index == n[1]{
        index -= 1
        ans = max(ans,num)
        num -= arr[i-n[1]+1]
    }
}
print(ans)