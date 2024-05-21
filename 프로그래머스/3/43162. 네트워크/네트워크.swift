import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var vis = Array(repeating: 0, count: n)
    var ans = 0
    var stack = [Int]()
    for i in 0..<n {
        if vis[i] == 1 { continue }
        stack.append(i)
        vis[i] = 1
        ans += 1
        while !stack.isEmpty {
            let first = stack.popLast()!
            for j in 0..<n {
                if computers[first][j] == 0 || vis[j] != 0 { continue }
                stack.append(j)
                vis[j] = 1
            }
        }
    }
    return ans
}
