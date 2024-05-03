func bfs(n: Int, knight: [Int], location: [Int]) -> Int {
    var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
    var queue = [(knight[0],knight[1])]
    arr[knight[0]][knight[1]] = 1
    var index = 0
    if knight == location {
        return 0
    }
    while queue.count > index {
        for i in 0..<8{
            let nx = queue[index].0 + dx[i]
            let ny = queue[index].1 + dy[i]
            if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
            if arr[nx][ny] != 0 { continue }
            queue.append((nx, ny))
            arr[nx][ny] = arr[queue[index].0][queue[index].1] + 1
            if (nx,ny) == (location[0],location[1]) {
                return arr[nx][ny]-1
            }
        }
        index += 1
    }
    return 0
}

let testCase = Int(readLine()!)!
let dx = [-2,-1,1,2,-2,-1,1,2]
let dy = [-1,-2,-2,-1,1,2,2,1]
for _ in 0..<testCase {
    let n = Int(readLine()!)!
    let knight = readLine()!.split(separator: " ").map { Int(String($0))! }
    let location = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(bfs(n: n, knight: knight, location: location))
}