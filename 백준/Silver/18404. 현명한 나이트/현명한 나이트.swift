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

var ans = ""
var e = [(Int,Int)]()
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
var vis = Array(repeating: Array(repeating: 0, count: n), count: n)

var queue = [(io.readInt()-1,io.readInt()-1)]

for _ in 0..<m {
    e.append((io.readInt()-1, io.readInt()-1))
}

func bfs() {
    vis[queue[0].0][queue[0].1] = 1
    let dx = [-2,-2,-1,-1,1,1,2,2]
    let dy = [-1,1,-2,2,-2,2,-1,1]
    var idx = 0
    while queue.count > idx {
        for i in 0..<8 {
            let nx = dx[i] + queue[idx].0
            let ny = dy[i] + queue[idx].1
            if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
            if vis[nx][ny] != 0 { continue }
            vis[nx][ny] = 1 + vis[queue[idx].0][queue[idx].1]
            queue.append((nx,ny))
        }
        idx += 1
    }
}

bfs()

for i in e {
    ans += "\(vis[i.0][i.1]-1) "
}
ans.removeLast()

print(ans)