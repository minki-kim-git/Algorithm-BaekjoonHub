import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        while now == 10 || now == 32 { now = read() }
        let beginIndex = index-1
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        while now == 10 || now == 32 { now = read() }
        let beginIndex = index-1
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}

let io = FileIO()

let n = io.readInt()

var queue = [(Int,Int)]()
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)
var vis = Array(repeating: Array(repeating: (0,0), count: n), count: n)

for i in 0..<n {
    for j in 0..<n {
        let input = io.readInt()
        arr[i].append(input)
        if arr[i][j] == 1 { 
//            vis[i][j].1 = 1
            queue.append((i, j)) }
    }
}

func dfs(_ n: Int, _ arr: [[Int]]) -> [[(Int,Int)]] {
    
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    var num = 1
    var stack = [(Int,Int)]()
    var vis = Array(repeating: Array(repeating: (0,0), count: n), count: n)

    for i in 0..<n {
        for j in 0..<n {
            if arr[i][j] == 0 || vis[i][j].0 != 0 { continue }
            stack.append((i, j))
            vis[i][j].0 = num
            while !stack.isEmpty {
                let top = stack.popLast()!
                for i in 0..<4 {
                 
                    let nx = dx[i] + top.0
                    let ny = dy[i] + top.1
                    if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
                    if vis[nx][ny].0 != 0 || arr[nx][ny] == 0 { continue }
                    vis[nx][ny].0 = num
                    stack.append((nx,ny))
                }
            }
            num += 1
        }
    }
    return vis
}

func bfs(_ n: Int, _ queue: [(Int,Int)], _ arr:[[(Int,Int)]]) -> Int {
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    var vis = arr
 
    var index = 0
    var ans = 1000
    var queue = queue
    while queue.count > index {
        for i in 0..<4 {
            let nx = dx[i] + queue[index].0
            let ny = dy[i] + queue[index].1
            if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
            if vis[nx][ny].0 != 0 && vis[nx][ny].0 != vis[queue[index].0][queue[index].1].0 {
           
                ans = min(ans, vis[queue[index].0][queue[index].1].1 + vis[nx][ny].1)
            }
            if vis[nx][ny].0 != 0 { continue }
            queue.append((nx, ny))
            vis[nx][ny].0 = vis[queue[index].0][queue[index].1].0
            vis[nx][ny].1 = vis[queue[index].0][queue[index].1].1 + 1
            
        }
        index += 1
    }

    return ans
}

let res =  dfs(n, arr)

print(bfs(n, queue, res))
