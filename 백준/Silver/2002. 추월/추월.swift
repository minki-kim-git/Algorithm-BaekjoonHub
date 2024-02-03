let n = Int(readLine()!)!
var start = [String]()
var end = [String]()
var count = 0
for _ in 0..<n{
    let input = readLine()!
    start.append(input)
}
for _ in 0..<n{
    let input = readLine()!
    end.append(input)
}
start.reverse()
for i in end{
    if start.last! == i {
        start.removeLast()
    } else {
        start.remove(at: start.firstIndex(of: i)!)
        count += 1
    }
}
print(count)
