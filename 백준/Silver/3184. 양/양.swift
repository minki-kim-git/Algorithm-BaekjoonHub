let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: "", count: 0), count: n[0])
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
for i in 0..<n[0]{
    arr[i].append(contentsOf: readLine()!.map{String($0)})
}
var stack = [(Int,Int)]()
var count = (0,0)
let dx = [1,-1,0,0]
let dy = [0,0,1,-1]
for i in 0..<n[0] {
    for j in 0..<n[1] {
        if arr[i][j] == "#" || vis[i][j] != 0 { continue }
        var dic = ["o":0,"v":0]
        if arr[i][j] == "v" {
            dic["v"] = dic["v"]! + 1
        } else if arr[i][j] == "o" {
            dic["o"] = dic["o"]! + 1
        }
        stack.append((i,j))
        vis[i][j] = 1
        while !stack.isEmpty {
            let top = stack.popLast()!
            for k in 0..<4 {
                let nx = dx[k] + top.0
                let ny = dy[k] + top.1
                if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
                if arr[nx][ny] == "#" || vis[nx][ny] != 0 { continue }
                if arr[nx][ny] == "v" {
                    dic["v"] = dic["v"]! + 1
                } else if arr[nx][ny] == "o" {
                    dic["o"] = dic["o"]! + 1
                }
                stack.append((nx,ny))
                vis[nx][ny] = 1
            }
        }
        if dic["o"]! > dic["v"]! {
            count.0 += dic["o"]!
        } else {
            count.1 += dic["v"]!
        }
        
        
    }
}
print(count.0, count.1)