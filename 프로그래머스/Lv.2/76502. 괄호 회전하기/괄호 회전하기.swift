import Foundation

func solution(_ s:String) -> Int {
    var ans = 0
    var sarr = [String]()
    var marr = [String]()
    var larr = [String]()
    var stack = [String]()
    var str = s
    
    for _ in 0..<s.count {
        var bool = true
        for i in str {
            switch i {
            case "(":
                stack.append("(")
            case "{":
                stack.append("{")
            case "[":
                stack.append("[")
            case ")":
                guard !stack.isEmpty else {
                    bool = false
                    break
                }
                if stack.last! == "("{
                    stack.removeLast()
                } else {
                    bool = false
                    break
                }
                
            case "}":
                guard !stack.isEmpty else {
                    bool = false
                    break
                }
                if stack.last! == "{"{
                    stack.removeLast()
                } else {
                    bool = false
                    break
                }
                
            case "]":
                guard !stack.isEmpty else {
                    bool = false
                    break
                }
                if stack.last! == "["{
                    stack.removeLast()
                } else {
                    bool = false
                    break
                }
                
            default:
                break
            }
        }
        if stack.isEmpty && bool == true{
            ans += 1
        }
        stack.removeAll()
        let firststr = String(str.first!)
        str.removeFirst()
        str += firststr
    }
    return ans
}