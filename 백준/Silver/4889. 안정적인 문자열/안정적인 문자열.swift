var index = 1
while let input = readLine(){
    guard !input.contains("-") else { break }
    var stack = [String]()
    var ans = 0
    for i in input {
        if i == "{" {
            stack.append("{")
        } else if i == "}"{
            if stack.isEmpty {
                ans += 1
                stack.append("{")
            } else {
                stack.removeLast()
            }
        }
    }
    if !stack.isEmpty {
        ans += stack.count / 2
    }
    print("\(index). \(ans)")
    index += 1
}