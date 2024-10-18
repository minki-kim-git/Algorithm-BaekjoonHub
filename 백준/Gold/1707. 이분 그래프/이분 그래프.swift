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






func bfs(_ v:Int, _ e:Int, _ arr: [[Int]]) -> Bool {
    
    var vis = Array(repeating: 0, count: v+1)
    var queue = [Int]()
    
    for i in 1...v {
        if vis[i] != 0 { continue }
        if !arr[i].isEmpty {
            queue.append(i)
            vis[i] = 1
            var idx = 0
            while queue.count > idx {
                for j in arr[queue[idx]] {
                    if vis[j] == vis[queue[idx]] { return false }
                    if vis[j] != 0 { continue }
                    queue.append(j)
                    if vis[queue[idx]] == 1 {
                        vis[j] = 2
                    } else {
                        vis[j] = 1
                    }
                }
                idx += 1
            }
        }
    }
    
    return true
}

let k = io.readInt()

for _ in 0..<k {
    
    let v = io.readInt()
    let e = io.readInt()
    
    var arr = Array(repeating: Array(repeating: 0, count: 0), count: v+1)
    
    for _ in 0..<e {
        let a = io.readInt()
        let b = io.readInt()
        arr[a].append(b)
        arr[b].append(a)
    }
    
    bfs(v, e, arr) == true ? print("YES") : print("NO")
}




