let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: 0, count: max(n[0],n[1])+2)
var queue = [n[0]]
vis[n[0]] = 1
var index = 0
let dx = [2,-1,1]
while queue.count > index {
    for i in 0..<3 {
        var nx = 0
        if i == 0 {
            nx = queue[index] * dx[i]
        } else {
            nx = queue[index] + dx[i]
        }
        if nx < 0 || nx >= vis.count { continue }
        if vis[nx] != 0 { continue }
        if i == 0 {
            vis[nx] = vis[queue[index]]
        } else {
            vis[nx] = vis[queue[index]] + 1
        }
        if nx == n[1] { break }
        queue.append(nx)
    }
    index += 1
}
print(vis[n[1]]-1)