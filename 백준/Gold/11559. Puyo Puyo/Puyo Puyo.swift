var ans = 0
var arr = Array(repeating: Array(repeating: "", count: 0), count: 12)

for i in 0..<12 {
    arr[i].append(contentsOf: readLine()!.map{String($0)})
}

func dfs(_ arr: [[String]]) -> (Int,[[String]]) {
    var arr = arr
    var count = 0
    var vis = Array(repeating: Array(repeating: 0, count: 6), count: 12)
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    for i in 0..<12 {
        for j in 0..<6 {
            if vis[i][j] != 0 { continue }
            var stack = [(i,j)]
            var temp = [(Int,Int)]() 
            while !stack.isEmpty {
                let top = stack.popLast()!
                for k in 0..<4 {
                    let nx = dx[k] + top.0
                    let ny = dy[k] + top.1
                    if nx < 0 || ny < 0 || nx >= 12 || ny >= 6 { continue }
                    if vis[nx][ny] != 0 || arr[nx][ny] == "." { continue }
                    if arr[nx][ny] != arr[top.0][top.1] { continue }
                    temp.append((nx,ny))
                    stack.append((nx,ny))
                    vis[nx][ny] = 1
                }
            }
            if temp.count >= 4 {
                for i in temp {
                    arr[i.0][i.1] = "."
                }
                count += 1
            }
        }
    }
    return (count,arr)
}

func dropPuyo(_ arr: [[String]]) -> [[String]] {
    var arr = arr
    for i in 0..<6 {
        var st = 11
        var en = 10
        while en >= 0 {
            if arr[st][i] == "." && arr[en][i] != "." {
                arr[st][i] = arr[en][i]
                arr[en][i] = "."
                st -= 1
                en -= 1
            } else {
                en -= 1
            }
            if arr[st][i] != "." {
                st -= 1
            }
        }
    }
    return arr
}

while true {
    let bfs = dfs(arr)
    arr = dropPuyo(bfs.1)
    if bfs.0 == 0 {
        print(ans)
        break
    }
    ans += 1
}