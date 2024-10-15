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

var arr = [0]
var vis = Array(repeating: 0, count: n+1)

for _ in 0..<n {
    arr.append(io.readInt())
}

let s = io.readInt()

vis[s] = 1
var idx = 0
var queue = [s]

while queue.count > idx {
    for i in 0..<2 {
        var nx = 0
        if i == 0 {
            nx = queue[idx] + arr[queue[idx]]
        } else {
            nx = queue[idx] - arr[queue[idx]]
        }
        if nx < 1 || nx > n { continue }
        if vis[nx] != 0 { continue }
        vis[nx] = 1
        queue.append(nx)
    }
    idx += 1
}

print(vis.reduce(0, +))