var ans = 0
let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[0])
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
for i in 0..<n[0] {
    arr[i].append(contentsOf: readLine()!.split(separator: " ").map{Int(String($0))!})
}
let dx = [0,0,1,-1,1,1,-1,-1]
let dy = [1,-1,0,0,1,-1,1,-1]
for i in 0..<n[0] {
    for j in 0..<n[1] {
        if arr[i][j] == 0 || vis[i][j] == 1 { continue }
        var stack = [(i,j)]
        ans += 1
        while !stack.isEmpty {
            let top = stack.popLast()!
            for i in 0..<8 {
                let nx = dx[i] + top.0
                let ny = dy[i] + top.1
                if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
                if arr[nx][ny] == 0 || vis[nx][ny] == 1 { continue }
                stack.append((nx, ny))
                vis[nx][ny] = 1
            }
        }
    }
}
print(ans)