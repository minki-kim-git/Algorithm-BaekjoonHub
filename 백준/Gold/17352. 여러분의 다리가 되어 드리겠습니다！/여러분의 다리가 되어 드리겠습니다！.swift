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

var arr = Array(repeating: Array(repeating: 0, count: 0), count: n+1)

for _ in 0..<n-2 {
    let a = io.readInt()
    let b = io.readInt()
    arr[a].append(b)
    arr[b].append(a)
}

func solve(_ n: Int, _ arr: [[Int]]) -> String {
    var vis = Array(repeating: 0, count: n+1)
    var queue = [1]
    var index = 0
    var ans = 0
    vis[1] = 1
    
    while queue.count > index {
        for i in arr[queue[index]] {
            if vis[i] == 1 { continue }
            queue.append(i)
            vis[i] = 1
        }
        index += 1
    }
    for i in 1...n {
        if vis[i] == 0 {
            ans = i
            break
        }
    }
    return "1 \(ans)"
}

print(solve(n,arr))