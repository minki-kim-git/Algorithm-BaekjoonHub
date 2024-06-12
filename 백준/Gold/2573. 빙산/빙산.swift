let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[0])
var temp = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
for i in 0..<n[0] {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i].append(contentsOf: input)
}
var stack = [(Int,Int)]()
var index = 0
let dx = [1,-1,0,0]
let dy = [0,0,1,-1]
var ans = 0
func checkBfs() -> Int {
    var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
    var count = 0
    for i in 0..<n[0] {
        for j in 0..<n[1] {
            if arr[i][j] == 0 || vis[i][j] != 0{ continue }
            stack.append((i,j))
            count += 1
            while !stack.isEmpty {
                let top = stack.popLast()!
                for k in 0..<4 {
                    let nx = dx[k] + top.0
                    let ny = dy[k] + top.1
                    if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
                    if arr[nx][ny] == 0 || vis[nx][ny] != 0 {
                        continue
                    }
                    vis[nx][ny] = 1
                    stack.append((nx,ny))
                }
            }
        }
    }
    if count > 1 {
        return 0
    } else if count == 0 {
        return 1
    }
    return 2
}
func meltBfs() {
    for i in 0..<n[0] {
        for j in 0..<n[1] {
            if arr[i][j] == 0 { continue }
            stack.append((i,j))
            while !stack.isEmpty {
                var count = 0
                let top = stack.popLast()!
                for k in 0..<4 {
                    let nx = dx[k] + top.0
                    let ny = dy[k] + top.1
                    if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1] { continue }
                    if arr[nx][ny] == 0 {
                        count += 1
                    }
                }
                if arr[i][j] - count > 0 {
                    temp[i][j] = arr[i][j] - count
                } else {
                    temp[i][j] = 0
                }
            }
        }
    }
    arr = temp
}
while true {
   let check = checkBfs()
    if check == 0 {
        print(ans)
        break
    } else if check == 1 {
        print(0)
        break
    }
    meltBfs()
    ans += 1
}