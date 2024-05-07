func dfs(arr: [[Int]], n: [Int]) -> Int {
    var stack = [(Int,Int)]()
    let dx = [0,-1,1,0]
    let dy = [-1,0,0,1]
    var vis = Array(repeating: Array(repeating: 0, count: n[0]), count: n[1])
    var count = 0
    for i in 0..<n[1] {
        for j in 0..<n[0]{
            if vis[i][j] == 1 || arr[i][j] == 0 { continue }
            vis[i][j] = 1
            stack.append((i,j))
            count += 1
            while !stack.isEmpty {
                let first = stack.popLast()!
                for i in 0..<4 {
                    let nx = dx[i] + first.0
                    let ny = dy[i] + first.1
                    if nx < 0 || ny < 0 || nx >= n[1] || ny >= n[0]{
                        continue
                    }
                    if vis[nx][ny] == 1 || arr[nx][ny] == 0 { continue }
                    vis[nx][ny] = 1
                    stack.append((nx,ny))
                }
            }
        }
    }
    return count
}
let testCase = Int(readLine()!)!
for _ in 0..<testCase {
    let n = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arr = Array(repeating: Array(repeating: 0, count: n[0]), count: n[1])
    for _ in 0..<n[2] {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        arr[input[1]][input[0]] = 1
    }
    print(dfs(arr: arr, n: n))
}