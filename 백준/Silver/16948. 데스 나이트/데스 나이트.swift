let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: Array(repeating: 0, count: n), count: n)
var queue = [(input[0],input[1])]
var index = 0
let dx = [-2,-2,0,0,2,2]
let dy = [-1,1,-2,2,-1,1]
func bfs() -> Int{
    while queue.count > index {
        for i in 0..<6 {
            let nx = dx[i] + queue[index].0
            let ny = dy[i] + queue[index].1
            if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
            if vis[nx][ny] != 0 { continue }
                vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
            queue.append((nx, ny))
            if nx == input[2] && ny == input[3] {
                return vis[nx][ny]
            }
        }
        index += 1
    }
    return -1
}
print(bfs())