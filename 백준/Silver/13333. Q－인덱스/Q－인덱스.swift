let n = Int(readLine()!)!

var arr = readLine()!.split(separator:" ").map{Int($0)!}.sorted(by: >)

var ans = 0

for i in 0..<n {
    if arr[i] >= i + 1 { 
        ans = i + 1
    } else {
        break
    }
}

print(ans)