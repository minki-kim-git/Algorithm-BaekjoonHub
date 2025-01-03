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

func bfs(_ n:Int, _ s:Int, _ e:Int, _ arr: [[Int]]) -> Int {
    
    var ans = 0
    var index = 0
    var queue = [s]
    let dx = [1,-1]
    var vis = Array(repeating: 0, count: n+1)
 
    while queue.count > index {
        for i in arr[queue[index]] {
            if vis[i] != 0 { continue }
            vis[i] = vis[queue[index]] + 1
            queue.append(i)
        }
        for i in 0..<2 {
            let nx = queue[index] + dx[i]
            if nx < 1 || nx > n || vis[nx] != 0 { continue }
            vis[nx] = vis[queue[index]] + 1
            queue.append(nx)
        }
        if vis[e] != 0 { return vis[e] }
        index += 1
    }
    return ans
}

let n = io.readInt()
let m = io.readInt()
let s = io.readInt()
let e = io.readInt()

var arr = Array(repeating: Array(repeating: 0, count: 0), count: n+1)

for _ in 0..<m {
    let x = io.readInt()
    let y = io.readInt()
    arr[x].append(y)
    arr[y].append(x)
}

print(bfs(n, s, e, arr))