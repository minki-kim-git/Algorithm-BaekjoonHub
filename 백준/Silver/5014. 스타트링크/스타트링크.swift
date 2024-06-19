let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: 0, count: n[0]+1)
vis[n[1]] = 1
var queue = [n[1]]
var index = 0
let dx = [n[3],-n[4]]
while queue.count > index {
    for i in 0..<2 {
        let nx = dx[i] + queue[index]
        if nx <= 0 || nx > n[0] { continue }
        if vis[nx] != 0 { continue }
        vis[nx] = vis[queue[index]] + 1
        queue.append(nx)
        if nx == n[2] {
            index = queue.count
            break
        }
    }
    index += 1
}
vis[n[2]] == 0 ? print("use the stairs") : print(vis[n[2]] - 1)