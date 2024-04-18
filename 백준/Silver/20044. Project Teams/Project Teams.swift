let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
input = input.sorted()
var ans = 1000000
var count = input.count - 1
for i in 0..<n {
    ans = min(ans,input[i]+input[count-i])
}
print(ans)