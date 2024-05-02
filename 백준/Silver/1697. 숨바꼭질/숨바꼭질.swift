let n = readLine()!.split(separator: " ").map { Int(String($0))! }
var vis = Array(repeating: 0, count: max(n[0], n[1])*2)
var queue = [Int]()
let dx = [1,-1,0]
queue.append(n[0])
var index = 0
if n[0] == n[1] {
    print(0)
} else {
    vis[n[0]] = 1
    while queue.count > index {
        for i in 0..<3 {
            var nx = dx[i] + queue[index]
            if i == 2 {
                nx = queue[index] * 2
            }
            if nx < 0 || nx >= vis.count { continue }
            if vis[nx] != 0 { continue }
            queue.append(nx)
            vis[nx] = vis[queue[index]] + 1
            if nx == n[1] {
                print(vis[nx]-1)
                break
            }
        }
        index += 1
    }
}