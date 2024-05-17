let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
var queue = [(Int,Int)]()
var index = 0
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
for i in 0..<n[0] {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<n[1] {
        if input[j] == 2 {
            queue.append((i,j))
            
        }
        arr[i][j] = input[j]
    }
}

while queue.count > index {
    for i in 0..<4 {
        let nx = dx[i] + queue[index].0
        let ny = dy[i] + queue[index].1
        if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
        if arr[nx][ny] == 0 || vis[nx][ny] != 0 { continue }
        queue.append((nx,ny))
        vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
    }
    index += 1
}
for i in 0..<n[0] {
    for j in 0..<n[1] {
        if vis[i][j] == 0 && arr[i][j] == 1 {
            vis[i][j] = -1
        }
    }
}
vis[queue.first!.0][queue.first!.1] = 0
_ = vis.map {
    var ans = ""
   _ =  $0.map {
        ans += "\($0) "
    }
    ans.removeLast()
    print(ans)
}
