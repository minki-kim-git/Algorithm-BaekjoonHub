let n = Int(readLine()!)!
var vis = Array(repeating: Array(repeating: 0, count: n), count: n)
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)
for i in 0..<n {
    arr[i].append(contentsOf:readLine()!.split(separator: " ").map { Int(String($0))! })
}
func bfs() -> String {
    var queue = [(0,0)]
    var index = 0
    while queue.count > index {
        for i in 0..<2 {
            var nx = queue[index].0
            var ny = queue[index].1
            if i == 0 {
                nx = arr[queue[index].0][queue[index].1] + queue[index].0
            } else {
                ny = arr[queue[index].0][queue[index].1] + queue[index].1
            }
            if nx >= n || ny >= n || vis[nx][ny] != 0 { continue }
            if arr[nx][ny] == -1 {
                return "HaruHaru"
                }
            queue.append((nx,ny))
            vis[nx][ny] = 1
        }
        index += 1
    }
    return "Hing"
}
print(bfs())