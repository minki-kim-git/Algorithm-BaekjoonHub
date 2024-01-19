let input = readLine()!.map{String($0)}
var stack = [String]()
var ans = 0
for i in input{
    if i == "(" {
        stack.append("(")
    } else if i == ")" {
        if stack.isEmpty {
            ans += 1
        } else {
            stack.removeLast()
        }
    }
}
ans += stack.count
print(ans)