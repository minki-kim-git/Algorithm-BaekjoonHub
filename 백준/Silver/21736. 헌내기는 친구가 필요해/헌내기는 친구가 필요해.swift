let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: "", count: n[1]), count: n[0])
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
var queue = [(Int,Int)]()
var ans = 0
let dx = [1,-1,0,0]
let dy = [0,0,1,-1]
var index = 0
for i in 0..<n[0] {
    let input = readLine()!.map{String($0)}
    for j in 0..<n[1] {
        arr[i][j] = input[j]
        if input[j] == "I" {
            queue.append((i,j))
        }
    }
}

while queue.count > index {
    for i in 0..<4 {
        let nx = dx[i] + queue[index].0
        let ny = dy[i] + queue[index].1
        if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
        if arr[nx][ny] == "X" || vis[nx][ny] == 1 { continue }
        queue.append((nx,ny))
        vis[nx][ny] = 1
        if arr[nx][ny] == "P" {
            ans += 1
        }
    }
    index += 1
}
ans == 0 ? print("TT") : print(ans)