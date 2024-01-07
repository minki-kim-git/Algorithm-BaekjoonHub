let input = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<input{
    let input = readLine()!.split(separator: " ")
    switch input[0] {
    case "push":
        arr.append(Int(input[1])!)
    case "pop":
        if !arr.isEmpty {
            arr.reverse()
            print(arr.last!)
            arr.removeLast()
            arr.reverse()
        } else {
            print(-1)
        }
    case "size":
        print(arr.count)
    case "empty":
        if arr.isEmpty{
            print(1)
        } else {
            print(0)
        }
    case "front":
        if !arr.isEmpty {
            print(arr.first!)
        } else {
            print(-1)
        }
    case "back":
        if !arr.isEmpty {
            print(arr.last!)
        } else {
            print(-1)
        }
    default:
        break
    }
}
