let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: "", count: n[1]), count: n[0])
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
var stack = [(Int,Int)]()
for i in 0..<n[0] {
    let input = readLine()!.map{String($0)}
    for j in 0..<n[1]{
        arr[i][j] = input[j]
        if input[j] == "L" {
            stack.append((i,j))
        }
    }
}
var queue = [(Int,Int)]()
var index = 0
var ans = 0
while !stack.isEmpty {
    let first = stack.popLast()!
    queue.append((first))
    vis[first.0][first.1] = 1
    while queue.count > index {
        for i in 0..<4 {
            let nx = dx[i] + queue[index].0
            let ny = dy[i] + queue[index].1
            if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
            if arr[nx][ny] == "W" || vis[nx][ny] != 0 { continue }
            queue.append((nx,ny))
            vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
        }
        index += 1
    }
    _ = vis.compactMap {
        ans = max ($0.max()!,ans)
    }
    vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
}
print(ans-1)