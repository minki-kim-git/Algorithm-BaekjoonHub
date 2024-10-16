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

func bfs(_ n:Int, _ m:Int, _ arr: [[Int]], _ queue: [(Int,Int)]) -> Int {
    let dx = [-1, -1, -1, 0, 1, 0, 1, 1]
    let dy = [-1, 0, 1, 1, 1, -1, 0, -1]
    
    var idx = 0
    var maxn = 0
    var queue = queue
    var vis = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    while queue.count > idx {
        for i in 0..<8 {
            let nx = dx[i] + queue[idx].0
            let ny = dy[i] + queue[idx].1
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            if vis[nx][ny] != 0 || arr[nx][ny] == 1 { continue }
            vis[nx][ny] = 1 + vis[queue[idx].0][queue[idx].1]
            queue.append((nx,ny))
            maxn = max(maxn,vis[nx][ny])
        }
        idx += 1
    }
    return maxn
}

let io = FileIO()

let n = io.readInt()
let m = io.readInt()

var queue = [(Int,Int)]()
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    for j in 0..<m {
        let input = io.readInt()
        arr[i].append(input)
        if input == 1 {
            queue.append((i,j))
        }
    }
}

print(bfs(n, m, arr, queue))