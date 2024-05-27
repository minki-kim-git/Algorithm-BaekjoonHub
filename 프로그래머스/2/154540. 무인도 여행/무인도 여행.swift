import Foundation

func solution(_ maps:[String]) -> [Int] {
    var arr = Array(repeating: Array(repeating:"",count:0),count:maps.count)
    for i in 0..<maps.count {
        arr[i].append(contentsOf: maps[i].map{String($0)})
    }
    var vis = Array(repeating: Array(repeating:0,count:arr[0].count),count:maps.count)
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var ans = [Int]()
    var stack = [(Int,Int)]()
    for i in 0..<maps.count {
        for j in 0..<arr[0].count {
            if arr[i][j] == "X" || vis[i][j] != 0 { continue }
            stack.append((i,j))
            vis[i][j] = 1
            var sum = Int(arr[i][j])!
            while !stack.isEmpty{
                let first = stack.popLast()!
                for i in 0..<4 {
                    let nx = dx[i] + first.0
                    let ny = dy[i] + first.1
                    if nx < 0 || ny < 0 || nx >= maps.count || ny >= arr[0].count { continue }
                    if vis[nx][ny] != 0 || arr[nx][ny] == "X" { continue }
                    vis[nx][ny] = 1
                    stack.append((nx,ny))
                    sum += Int(arr[nx][ny])!
                }
            }
            ans.append(sum)
        }
    }
    return ans.isEmpty ? [-1] : ans.sorted()
}