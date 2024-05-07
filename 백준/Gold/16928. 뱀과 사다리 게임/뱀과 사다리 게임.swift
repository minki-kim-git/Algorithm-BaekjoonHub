let n = readLine()!.split(separator: " ").map { Int(String($0))! }
var ladder = [Int:Int]()
var snake = [Int:Int]()
for _ in 0..<n[0] {
    let input = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    ladder[input[0]] = input[1]
}
for _ in 0..<n[1] {
    let input = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    snake[input[0]] = input[1]
}
let dx = [1,2,3,4,5,6]
var vis = Array(repeating: 0, count: 101)
var queue = [1]
var index = 0
while queue.count > index {
    for i in 0..<6{
        let nx = dx[i] + queue[index]
        if nx >= 101 || vis[nx] != 0 { continue }
        if let val = ladder[nx] {
            if vis[val] != 0 {
                vis[val] = min(vis[queue[index]] + 1,vis[val])
            } else {
                vis[val] = vis[queue[index]] + 1
            }
            queue.append(val)
        }
        else if let val = snake[nx] {
            if vis[val] != 0 {
                vis[val] = min(vis[queue[index]] + 1,vis[val])
            } else {
                vis[val] = vis[queue[index]] + 1
            }
            queue.append(val)
        } else {
            queue.append(nx)
        }
        vis[nx] = vis[queue[index]] + 1
    }
    index += 1
}
print(vis[100])