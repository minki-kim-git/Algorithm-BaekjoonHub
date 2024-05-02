let num = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = num[0]
let m = num[1]
var vis = Array(repeating: Array(repeating: -1, count: m), count: n)
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)
for i in 0..<n {
    arr[i].append(contentsOf: readLine()!.map{Int(String($0))!})
}
let dx = [0,-1,0,1]
let dy = [-1,0,1,0]
var queue = [[Int:Int]]()
queue.append([0:0])
vis[0][0] = 1
while !queue.isEmpty{
    for i in 0..<4 {
        let nx = queue.first!.first!.key + dx[i]
        let ny = queue.first!.first!.value + dy[i]
        if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
        if arr[nx][ny] == 0 || !(vis[nx][ny] == -1) { continue }
        vis[nx][ny] = vis[queue.first!.first!.key][queue.first!.first!.value] + 1
        queue.append([nx:ny])
    }
    queue.removeFirst()
}
print(vis[n-1][m-1])