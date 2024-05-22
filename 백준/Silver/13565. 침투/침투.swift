let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[0])

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
for i in 0..<n[0] {
    let input = readLine()!.map{Int(String($0))!}
    arr[i].append(contentsOf: input)
}
var stack = [(Int,Int)]()
var index = 0
var ans = 0
func dfs() -> String {
    var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
    for j in 0..<n[1] {
        if arr[0][j] == 1 { continue }
        stack.append((0,j))
        vis[0][j] = 1
        while !stack.isEmpty {
            let first = stack.popLast()!
            for i in 0..<4 {
                let nx = dx[i] + first.0
                let ny = dy[i] + first.1
                if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
                if arr[nx][ny] == 1 || vis[nx][ny] != 0 { continue }
                if nx == n[0]-1 {
                    return "YES"
                }
                stack.append((nx,ny))
                vis[nx][ny] = 1
            }
            index += 1
        }
    }
    return "NO"
}
print(dfs())