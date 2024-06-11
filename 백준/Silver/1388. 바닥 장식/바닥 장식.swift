let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: "", count: 0), count: n[0])
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
for i in 0..<n[0] {
    let input = readLine()!.map{String($0)}
    arr[i].append(contentsOf: input)
}
var stack = [(Int,Int)]()
let dx = [0,1]
let dy = [1,0]
var ans = 0
for i in 0..<n[0] {
    for j in 0..<n[1] {
        if vis[i][j] != 0 { continue }
        ans += 1
        vis[i][j] = 1
        stack.append((i, j))
        let str = arr[i][j]
        while !stack.isEmpty {
            let top = stack.popLast()!
            var nx = top.0
            var ny = top.1
            if str == "|" {
                 nx += 1
            } else {
                 ny += 1
            }
            if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
            if vis[nx][ny] != 0 || arr[nx][ny] != str { continue }
            stack.append((nx,ny))
            vis[nx][ny] = 1
        }
    }
}
print(ans)