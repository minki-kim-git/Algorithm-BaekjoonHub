let input = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<input{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    switch input[0] {
    case 1:
        arr.append(input[1])
    case 2:
        if !arr.isEmpty {
            print(arr.last!)
            arr.removeLast()
        } else {
            print(-1)
        }
    case 3:
        print(arr.count)
    case 4:
        if arr.isEmpty{
            print(1)
        } else {
            print(0)
        }
    case 5:
        if !arr.isEmpty {
            print(arr.last!)
        } else {
            print(-1)
        }
    default:
        break
    }
}