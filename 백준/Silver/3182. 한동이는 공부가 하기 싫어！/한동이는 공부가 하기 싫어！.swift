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
var ans = 0
var maxn = 0

for _ in 0..<n {
    arr.append(io.readInt())
}

func dfs(_ arr:[Int], _ i:Int) -> Int {
    var vis = Array(repeating: 0, count: n+1)
    var stack = [arr[i]]
    vis[i] = 1
    var count = 1
    while !stack.isEmpty {
        let top = stack.popLast()!
        if vis[top] != 0 { continue }
        stack.append(arr[top])
        count += 1
        vis[top] = 1
    }
    return count
}

for i in 1...n {
    let count = dfs(arr,i)
    if count > maxn {
        maxn = count
        ans = i
    }
}

print(ans)