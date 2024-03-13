var deQueue = [Int]()
var enQueue = [Int]()
let n = Int(readLine()!)!
for _ in 0..<n{
    let input = readLine()!.split(separator:" ").map{Int(String($0))!}
    switch  input[0] {
    case 1:
        deQueue.append(input[1])
    case 2:
        enQueue.append(input[1])
    case 3:
        if deQueue.isEmpty {
            if enQueue.isEmpty {
                print(-1)
                break
            }
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        print(deQueue.popLast()!)
    case 4:
        if enQueue.isEmpty {
            if deQueue.isEmpty {
                print(-1)
                break
            }
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        print(enQueue.popLast()!)
    case 5:
        print(deQueue.count + enQueue.count)
    case 6:
        deQueue.isEmpty && enQueue.isEmpty ? print(1) : print(0)
    case 7:
        if deQueue.isEmpty{
            if enQueue.isEmpty {
                print(-1)
                break
            }
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        print(deQueue.last!)
    case 8:
        if enQueue.isEmpty {
            if deQueue.isEmpty {
                print(-1)
                break
            }
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        print(enQueue.last!)
    default:
        break
    }
}