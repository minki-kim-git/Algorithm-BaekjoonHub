let n = Int(readLine()!)!
var dic = [[Int:Int]]()
var ans = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    dic.append([input[0]:input[1]])
    
}
var arr = dic.sorted {
    $0.first!.key < $1.first!.key
}

for i in 0..<arr.count {
    if ans <= arr[i].first!.key {
        ans = 0
        ans = arr[i].first!.key + arr[i].first!.value
    } else {
        ans += arr[i].first!.value
    }
}
print(ans)