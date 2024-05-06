let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)
var vis = Array(repeating: Array(repeating: 0, count: n), count: n)
var ans = [Int]()
var queue = [(Int,Int)]()
let dx = [0,-1,1,0]
let dy = [-1,0,0,1]

for i in 0..<n{
    let input = readLine()!.map { Int(String($0))! }
    arr[i].append(contentsOf: input)
}
for i in 0..<n{
    for j in 0..<n{
        if arr[i][j] == 0 || vis[i][j] == 1 { continue }
        queue.append((i,j))
        vis[i][j] = 1
        var index = 0
        var count = 1
        while queue.count > index {
            for i in 0..<4 {
                let nx = dx[i] + queue[index].0
                let ny = dy[i] + queue[index].1
                if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
                if arr[nx][ny] == 0 || vis[nx][ny] == 1 { continue }
                vis[nx][ny] = 1
                queue.append((nx,ny))
                count += 1
            }
            index += 1
        }
        ans.append(count)
    }
}
print(ans.count)
_ = ans.sorted().map {
    print($0)
}