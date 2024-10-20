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
let k = io.readInt()

var arr = [[Int]]()

for _ in 0..<2 {
    arr.append(io.readString().map{Int(String($0))!})
}

func bfs() -> Int {
    
    var index = 0
    var queue = [(0,0)]
    let dy = [-1,1,k]
    
    var vis = Array(repeating: Array(repeating: 0, count: n), count: 2)
    vis[0][0] = 1
    
    while queue.count > index {
        for i in 0..<3 {
            var nx = queue[index].0
            let ny = queue[index].1 + dy[i]
            if i == 2 {
                  nx = nx == 0 ? 1 : 0
              } else {
                  nx = nx == 1 ? 1 : 0
              }
            if ny >= n { return 1 }
            if ny < 0 || arr[nx][ny] == 0 || vis[nx][ny] != 0 { continue }
            if ny < vis[queue[index].0][queue[index].1]  { continue }
            vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
            queue.append((nx, ny))
        }
        index += 1
    }
    return 0
}

print(bfs())