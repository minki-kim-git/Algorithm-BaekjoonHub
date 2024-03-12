let n = readLine()!.split(separator: " ").map { Int(String($0))! }
var input = readLine()!.map{String($0)}
var ans = 0
var str = ""
for i in 0..<input.count {
    guard input[i] != "" else { continue }
    str = input[i]
    for j in i+1...i+n[1] {
        guard j < input.count else { break }
        if str != input[j] && input[j] != "" {
            ans += 1
            input[j] = ""
            break
        }
    }
}
print(ans)