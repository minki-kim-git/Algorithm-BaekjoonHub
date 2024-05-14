let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!
var stack = [String]()
var count = 0
for i in input {
    while count < n[1] {
        guard !stack.isEmpty else { break }
        if Int(String(stack.last!))! < Int(String(i))! {
            stack.removeLast()
            count += 1
        } else {
            break
        }
    }
    stack.append(String(i))
}
if count == n[1] {
    print(stack.joined())
} else {
    for _ in 0..<n[1]-count {
        stack.removeLast()
    }
    print(stack.joined())
}