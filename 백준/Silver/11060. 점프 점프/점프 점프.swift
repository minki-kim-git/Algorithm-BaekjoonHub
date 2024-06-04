let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var vis = Array(repeating: 0, count: n)
vis[0] = 1
var queue = [0]
var index = 0
while queue.count > index {
    for i in 0..<arr[queue[index]] {
        let dx = i + 1 + queue[index]
        if dx >= n { break }
        if vis[dx] != 0 { continue }
        queue.append(dx)
        vis[dx] = vis[queue[index]] + 1
    }
    index += 1
}
vis.last! == 0 ? print(-1) : print(vis.last!-1)