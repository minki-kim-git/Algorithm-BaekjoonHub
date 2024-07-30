let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[1])
var vis = Array(repeating: Array(repeating: 0, count: n[0]), count: n[1])

for i in 0..<n[1] {
    arr[i].append(contentsOf: readLine()!.split(separator: " ").map{Int(String($0))!})
}

let dx = [0,1]
let dy = [1,0]
var queue = [(0,0)]
var index = 0
vis[0][0] = 1

while queue.count > index {
    for i in 0..<2 {
        let nx = dx[i] + queue[index].0
        let ny = dy[i] + queue[index].1
        
        if nx >= n[1] || ny >= n[0] || nx < 0 || ny < 0 { continue }
        if vis[nx][ny] != 0 || arr[nx][ny] == 0 { continue }
        queue.append((nx, ny))
        vis[nx][ny] = 1
    }
    index += 1
}

vis[n[1]-1][n[0]-1] == 0 ? print("No") : print("Yes")