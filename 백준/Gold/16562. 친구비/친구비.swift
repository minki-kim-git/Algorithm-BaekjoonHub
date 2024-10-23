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
let k = io.readInt()

var money = [0]
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n+1)

for _ in 0..<n {
    money.append(io.readInt())
}

for _ in 0..<m {
    let v = io.readInt()
    let w = io.readInt()
    arr[v].append(w)
    arr[w].append(v)
}

func bfs() -> String {
    var ans = 0
    var vis = Array(repeating: 0, count: n+1)
    
    for i in 1...n {
        if vis[i] != 0 { continue }
        vis[i] = 1
        var queue = [i]
        var idx = 0
        var minn = money[i]
        while queue.count > idx {
            for j in arr[queue[idx]] {
                if vis[j] != 0 { continue }
                queue.append(j)
                vis[j] = 1
                if minn > money[j] { minn = money[j] }
            }
            idx += 1
        }
        ans += minn
        if ans > k { return "Oh no" }
    }
    return "\(ans)"
}

print(bfs())