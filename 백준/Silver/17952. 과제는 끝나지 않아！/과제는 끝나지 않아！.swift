let n = Int(readLine()!)!
var arr = [[Int:Int]]()
var ans = 0
for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    if input[0] == 1{
        arr.append([input[1]:input[2]])
    }
    if !arr.isEmpty{
        arr[arr.count-1][arr.last!.keys.first!]! -= 1
        if arr.last!.values.first! == 0 {
            ans += arr.last!.keys.first!
            arr.removeLast()
        }
    }
}
print(ans)
