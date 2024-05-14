let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
var arr = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
var stack = [(Int,Int)]()
var trash = [(Int,Int)]()
for _ in 0..<n[2]{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[input[0]-1][input[1]-1] = 1
    trash.append((input[0]-1,input[1]-1))
}
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
var ans = 0
for i in trash {
    if vis[i.0][i.1] == 1 { continue }
    stack.append(i)
    vis[i.0][i.1] = 1
    var count = 1
    while !stack.isEmpty {
        let top = stack.popLast()!
        for i in 0..<4{
            let nx = dx[i] + top.0
            let ny = dy[i] + top.1
            if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] {
                continue
            }
            if arr[nx][ny] == 0 || vis[nx][ny] == 1 { continue }
            stack.append((nx,ny))
            vis[nx][ny] = 1
            count += 1
        }
    }
   ans = max(ans,count)
}
print(ans)