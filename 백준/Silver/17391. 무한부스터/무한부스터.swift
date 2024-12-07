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
let m = io.readInt()

var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    for _ in 0..<m {
        arr[i].append(io.readInt())
    }
}

func bfs(_ n: Int, _ m: Int, _ arr: [[Int]]) -> Int {
    var index = 0
    var queue = [(0,0)]
    var vis = Array(repeating: Array(repeating: 0, count: m), count: n)
 
    while queue.count > index {
        for i in 0..<2 {
            var nx = queue[index].0
            var ny = queue[index].1
            for _ in 0..<arr[queue[index].0][queue[index].1] {
                if i == 1 {
                    nx += 1
                } else {
                    ny += 1
                }
                if nx >= n { nx = n - 1 }
                if ny >= m { ny = m - 1 }
                if vis[nx][ny] != 0 { continue }
                queue.append((nx, ny))
                vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
                if nx == n - 1 && ny == m - 1 {
                    return vis[nx][ny] }
            }
        }
        index += 1
    }
    return 0
}

print(bfs(n, m, arr))