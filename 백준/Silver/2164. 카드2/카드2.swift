let input = Int(readLine()!)!
var queue = Array(Array(1...input).reversed())
var arr = [Int]()
while queue.count > 1 {
    queue.removeLast()
    arr.append(queue.popLast()!)
    if queue.count <= 1{
        if queue.count == 1{
            let temp = queue.last!
            queue = arr.reversed()
            queue.append(temp)
        } else {
            queue = arr.reversed()
        }
        arr.removeAll()
    } 
}
queue.isEmpty ? print(1) : print(queue.last!)