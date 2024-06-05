func bfs(queue:[(Int,Int)],vis: [[Int]], arr: [[Int]]) -> ((Int,Int),Int,Int) {
    var queue = queue
    var index = 0
    var vis = vis
    var time = -1
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var gram = (-1,-1)
    while queue.count > index {
        for i in 0..<4 {
            let nx = dx[i] + queue[index].0
            let ny = dy[i] + queue[index].1
            if nx < 0 || ny < 0 || nx >= arr.count || ny >= arr[0].count { continue }
            if vis[nx][ny] != 0 || arr[nx][ny] == 1 { continue }
            queue.append((nx,ny))
            vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
            if arr[nx][ny] == 2 {
                gram = (nx,ny)
                time = vis[nx][ny]
            }
            if nx == arr.count - 1 && ny == arr[0].count - 1 {
                return (gram,time,vis[nx][ny])
            }
        }
        index += 1
    }
    return (gram,time,-1)
}
let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[0])
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
for i in 0..<n[0] {
    arr[i].append(contentsOf: readLine()!.split(separator: " ").map{Int(String($0))!})
}
var queue = [(0,0)]
let val = bfs(queue: [(0,0)], vis: vis, arr: arr)
let gramDistance = n[0] - val.0.0 + n[1] - val.0.1 - 2
if val.1 > 0 && val.2 > 0 {
   let min = min(gramDistance + val.1 , val.2)
    min <= n[2] ? print(min) : print("Fail")
} else if val.1 > 0 {
    val.1 + gramDistance <= n[2] ? print(val.1 + gramDistance) : print("Fail")
} else if val.2 > 0 {
    val.2 <= n[2] ? print(val.2) : print("Fail")
} else {
    print("Fail")
}