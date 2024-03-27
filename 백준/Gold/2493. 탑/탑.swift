let _ = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [0]
var ans = "0 "
for i in 1..<input.count{
    if input[i-1] > input[i] {
        ans += "\(i) "
        stack.append(i-1)
    } else {
        while stack.count > 0{
            if input[stack.last!] > input[i]{
                ans += "\(stack.last!+1) "
                break
            } else {
                stack.removeLast()
            }
        }
        if stack.isEmpty {
            stack.append(i)
            ans += "\(0) "
        }
    }
}
ans.removeLast()
print(ans)