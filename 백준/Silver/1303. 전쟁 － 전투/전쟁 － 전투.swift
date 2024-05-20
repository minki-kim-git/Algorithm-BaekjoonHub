import Foundation
let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: "", count: 0), count: n[1])
var vis = Array(repeating: Array(repeating: 0, count: n[0]), count: n[1])
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
for i in 0..<n[1] {
    let input = readLine()!.map{String($0)}
    arr[i].append(contentsOf: input)
}
func bfs(soldier: String) -> Int {
    var num = 0
    var index = 0
    var stack = [(Int,Int)]()
    for i in 0..<n[1] {
        for j in 0..<n[0] {
            if arr[i][j] != soldier || vis[i][j] != 0 {
                continue
            }
            stack.append((i,j))
            vis[i][j] = 1
            var count = 1
            while !stack.isEmpty {
                let top = stack.popLast()!
                for i in 0..<4 {
                    let nx = dx[i] + top.0
                    let ny = dy[i] + top.1
                    if nx < 0 || ny < 0 || nx >= n[1] || ny >= n[0] { continue }
                    if arr[nx][ny] != soldier || vis[nx][ny] != 0 { continue }
                    stack.append((nx,ny))
                    vis[nx][ny] = 1
                    count += 1
                }
                index += 1
            }
            num += Int(pow(Double(count),2))
        }
    }
    return num
}

print(bfs(soldier: "W"),terminator: " ")
print(bfs(soldier: "B"))