var arr1 = [Int]()
var arr2 = [Int]()
let n = Int(readLine()!)!
for _ in 0..<n{
    let input = readLine()!.split(separator:" ")
    switch  input[0] {
    case "push_front":
        arr1.append(Int(input[1])!)
    case "push_back":
        arr2.append(Int(input[1])!)
    case "pop_front":
        if arr1.isEmpty {
            if arr2.isEmpty {
                print(-1)
                break
            }
            arr1 = arr2.reversed()
            arr2.removeAll()
        }
        print(arr1.popLast()!)
    case "pop_back":
        if arr2.isEmpty {
            if arr1.isEmpty {
                print(-1)
                break
            }
            arr2 = arr1.reversed()
            arr1.removeAll()
        }
        print(arr2.popLast()!)
    case "size":
        print(arr1.count + arr2.count)
    case "empty":
        arr1.isEmpty && arr2.isEmpty ? print(1) : print(0)
    case "front":
        if arr1.isEmpty{
            if arr2.isEmpty {
                print(-1)
                break
            }
            arr1 = arr2.reversed()
            arr2.removeAll()
        }
        print(arr1.last!)
    case "back":
        if arr2.isEmpty {
            if arr1.isEmpty {
                print(-1)
                break
            }
            arr2 = arr1.reversed()
            arr1.removeAll()
        }
        print(arr2.last!)
    default:
        break
    }
}