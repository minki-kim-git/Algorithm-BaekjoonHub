var dic = [String:Int]()
var enqueue = [String]()
var dequeue = [String]()
let n = Int(readLine()!)!
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    dic[input[0]] = Int(input[1])!-1
    enqueue.append(input[0])
}
enqueue = enqueue.reversed()
while enqueue.count > 1 {
    for _ in 0..<dic[enqueue.popLast()!]!{
        dequeue.append(enqueue.popLast()!)
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
    }
    enqueue = dequeue.reversed() + enqueue
    dequeue.removeAll()
    enqueue.removeLast()
}
print(enqueue[0])