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

func bfs() -> (Int, [Int]) {
    var ans = [Int]()
    var score = 10000
    
    for i in 1...n {
        var vis = Array(repeating: 0, count: n+1)
        var queue = [i]
        vis[i] = 1
        var index = 0
        
        while queue.count > index {
            for j in arr[queue[index]] {
                if vis[j] != 0 { continue }
                vis[j] = vis[queue[index]] + 1
                queue.append(j)
            }
            index += 1
        }
        let maxVis = vis.max()! - 1
        
        if score == maxVis{
            ans.append(i)
        } else if score > maxVis {
            ans.removeAll()
            ans.append(i)
            score = maxVis
        }
    }
    
    return (score,ans)
}

while true {
    let a = io.readInt()
    let b = io.readInt()
    if a == -1 && b == -1 { break }
    arr[a].append(b)
    arr[b].append(a)
}

let ans = bfs()
print(ans.0,ans.1.count)
print(ans.1.map{String($0)}.joined(separator: " "))