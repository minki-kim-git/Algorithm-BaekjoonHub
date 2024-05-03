let count = Int(readLine()!)!
let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 0), count: count+1)
var num = 0
var vis = Array(repeating: 0, count: count+1)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr[input[1]].append(input[0])
    arr[input[0]].append(input[1])
}
var stack = [Int]()
for i in arr[1] {
    stack.append(i)
    num += 1
}
while !stack.isEmpty {
    let index = stack.popLast()!
    vis[index] = 1
    for i in arr[index]{
        if vis[i] == 1 { continue }
        stack.append(i)
        num += 1
    }
}
let ans = vis.filter({ $0 == 1 }).count - 1
ans > 0 ? print(ans) : print(0)