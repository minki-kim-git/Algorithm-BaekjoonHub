var dequeue = [Int]()
var ans = ""
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var enqueue = Array(Array(1...input[0]).reversed())
var count = 0
while enqueue.count > 0 {
    count += 1
    if count == input[1] {
        count = 0
        ans += "\(enqueue.popLast()!), "
    } else {
        dequeue.append(enqueue.popLast()!)
    }
    if enqueue.isEmpty {
        enqueue = dequeue.reversed()
        dequeue.removeAll()
    }
}
ans.removeLast(2)
print("<\(ans)>")