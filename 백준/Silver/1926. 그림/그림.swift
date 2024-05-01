import Foundation
let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[0])
for i in 0..<n[0]{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i].append(contentsOf: input)
}
var vis = Array(repeating: Array(repeating: 0, count: n[1]), count: n[0])
var ans = [Int]()
var dx = [0,0,-1,1]
var dy = [1,-1,0,0]
var queue = [[Int:Int]]()
var count = 0
for i in 0..<n[0] {
    for j in 0..<n[1] {
        if arr[i][j] == 0 || vis[i][j] == 1{ continue }
        vis[i][j] = 1
        queue.append([i:j])
        count += 1
        while !queue.isEmpty {
            for i in 0..<4 {
                let nx = queue.first!.first!.key + dx[i]
                let ny = queue.first!.first!.value + dy[i]
                if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[1]{ continue }
                if arr[nx][ny] == 0 || vis[nx][ny] == 1 { continue }
                vis[nx][ny] = 1
                queue.append([nx:ny])
                count += 1
            }
            queue.removeFirst()
        }
        ans.append(count)
        count = 0
    }
}
print(ans.count)
print(ans.max() ?? 0)