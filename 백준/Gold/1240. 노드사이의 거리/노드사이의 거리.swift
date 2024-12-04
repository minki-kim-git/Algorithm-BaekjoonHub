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

var arr = Array(repeating: Array(repeating: 0, count: 0), count: n+1)
var len = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var dic = [Int:Int]()

for _ in 0..<n - 1 {
    let a = io.readInt()
    let b = io.readInt()
    let l = io.readInt()
    arr[a].append(b)
    arr[b].append(a)
    len[a][b] = l
    len[b][a] = l
}

func dfs(_ a: Int, _ b: Int) -> Int {
    var vis = Array(repeating: 0, count: n+1)
    var stack = [a]
    vis[a] = 1
    while !stack.isEmpty {
        let top = stack.popLast()!
        for i in arr[top] {
            if vis[i] != 0 { continue }
            vis[i] = len[top][i] + vis[top]
            stack.append(i)
        }  
    }
    return vis[b]-1
}


for _ in 0..<m {
    let a = io.readInt()
    let b = io.readInt()
    print(dfs(a,b))
}