let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = 0
var w = 0
var queue = [Int]()
input = input.reversed()
while !input.isEmpty {
    if queue.count == n[1] {
        w -= queue.first!
        queue.removeFirst()
    }
    if w + input.last! <= n[2] {
        w += input.last!
        queue.append(input.popLast()!)
        ans += 1
    } else {
        ans += 1
        queue.append(0)
    }
}
ans += n[1]
print(ans)