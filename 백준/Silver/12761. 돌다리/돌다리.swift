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

let a = io.readInt()
let b = io.readInt()
let n = io.readInt()
let m = io.readInt()

func minCount(_ a:Int, _ b:Int, _ n:Int, _ m:Int) -> Int {
    var index = 0
    var queue = [n]
    var vis = Array(repeating: 0, count: 100001)
    
    
    vis[n] = 1
    let dx = [a,b,-a,-b,a,b,1,-1]
    
    while queue.count > index {
        var nx = 0
        for i in 0..<8 {
            switch i {
            case 0: nx = queue[index] * dx[i]
            case 1: nx = queue[index] * dx[i]
            default:
                nx = queue[index] + dx[i]
            }
            if nx < 0 || nx > 100000 { continue }
            if vis[nx] != 0 { continue }
            vis[nx] = vis[queue[index]] + 1
            queue.append(nx)
            if nx == m { return vis[nx] }
        }
        index += 1
    }
    return 1
}

print(minCount(a,b,n,m) - 1)