import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var count = 0
    var stack = [String]()
    for i in number {
        while count < k {
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
    if count != k {
        for _ in 0..<k-count {
            stack.removeLast()
        }
    }
    return stack.joined()
}