let n = Int(readLine()!)!
var stack = [(Int,Int)]()
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)
var vis = Array(repeating: Array(repeating: 0, count: n), count: n)
var set : Set = [0]
let dx = [1,0,0,-1]
let dy = [0,1,-1,0]
var ans = [Int]()
for i in 0..<n {
    
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    _ = input.map {
        set.insert($0)
    }
    arr[i].append(contentsOf: input)
    
}
for num in set {
    var count = 0
    for i in 0..<n {
        for j in 0..<n{
            if arr[i][j] <= num || vis[i][j] != 0 { continue }
            stack.append((i,j))
            vis[i][j] = 1
            count += 1
            while !stack.isEmpty {
                let top = stack.popLast()!
                for i in 0..<4{
                    let nx = dx[i] + top.0
                    let ny = dy[i] + top.1
                    if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
                    if arr[nx][ny] <= num || vis[nx][ny] != 0 { continue }
                    stack.append((nx,ny))
                    vis[nx][ny] = 1
                }
            }
        }
    }
    ans.append(count)
    vis = Array(repeating: Array(repeating: 0, count: n), count: n)
}
print(ans.max()!)