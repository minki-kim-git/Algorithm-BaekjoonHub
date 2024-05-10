let dx = [1,0,0,-1,-1,1,-1,1]
let dy = [0,1,-1,0,-1,-1,1,1]
while let input = readLine(){
    guard "0 0" != input else {break}
    let n = input.split(separator: " ").map{Int(String($0))!}
    var vis = Array(repeating: Array(repeating: 0, count: n[0]), count: n[1])
    var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[1])
    for i in 0..<n[1] {
        arr[i].append(contentsOf:readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    var stack = [(Int,Int)]()
    var count = 0
    for i in 0..<n[1] {
        for j in 0..<n[0]{
            if arr[i][j] == 0 || vis[i][j] != 0 { continue }
            stack.append((i,j))
            vis[i][j] = 1
            count += 1
            while !stack.isEmpty {
                let top = stack.popLast()!
                for i in 0..<8 {
                    let nx = dx[i] + top.0
                    let ny = dy[i] + top.1
                    if nx < 0 || ny < 0 || nx >= n[1] || ny >= n[0] {
                        continue
                    }
                    if arr[nx][ny] == 0 || vis[nx][ny] != 0 { continue }
                    stack.append((nx,ny))
                    vis[nx][ny] = 1
                }
            }
        }
    }
    print(count)
}