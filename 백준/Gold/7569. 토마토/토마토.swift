let n = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = Array(repeating: Array(repeating: Array(repeating: 0, count: n[0]), count: n[1]), count: n[2])
var vis = Array(repeating: Array(repeating: Array(repeating: 0, count: n[0]), count: n[1]), count: n[2])
var queue = [(Int,Int,Int)]()
let dx = [0,1,-1,0,0,0]
let dy = [-1,0,0,1,0,0]
let dz = [0,0,0,0,1,-1]
var index = 0
var ans = 1
for i in 0..<n[2] {
    for j in 0..<n[1] {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        for k in 0..<n[0] {
            arr[i][j][k] = input[k]
            if input[k] == -1 {
                vis[i][j][k] = -1
            } else if input[k] == 1 {
                queue.append((j,k,i))
                vis[i][j][k] = 1
            }
        }
    }
}
while queue.count > index {
    for i in 0..<6{
        let nx = dx[i] + queue[index].0
        let ny = dy[i] + queue[index].1
        let nz = dz[i] + queue[index].2
        if nx < 0 || ny < 0 || nz < 0 || nx >= n[1] || ny >= n[0] || nz >= n[2] { continue }
        if vis[nz][nx][ny] != 0 || arr[nz][nx][ny] == -1 || arr[nz][nx][ny] == 1 { continue }
        queue.append((nx,ny,nz))
        vis[nz][nx][ny] = vis[queue[index].2][queue[index].0][queue[index].1] + 1
        ans = max(ans,vis[nz][nx][ny])
    }
    index += 1
}
for i in 0..<n[2] {
    for j in 0..<n[1] {
        for k in 0..<n[0] {
            if vis[i][j][k] == 0 {
                ans = 0
            }
        }
    }
}
print(ans-1)