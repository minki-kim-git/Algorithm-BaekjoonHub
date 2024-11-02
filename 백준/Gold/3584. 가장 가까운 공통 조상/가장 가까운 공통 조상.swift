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

func solve(_ arr: [[Int]], _ a: Int, _ b: Int, _ n: Int) -> Int{
    var vis = Array(repeating: 0, count: n+1)
    var stack = [a]
    vis[a] = 1
    while !stack.isEmpty {
        let top = stack.popLast()!
        for i in arr[top] {
            if vis[i] != 0 { continue }
            stack.append(i)
            vis[i] = 1
        }
    }
    stack = [b]
    if vis[b] == 1 { return b }
    while !stack.isEmpty {
        let top = stack.popLast()!
        for i in arr[top] {
            if vis[i] == 1 { return i }
            stack.append(i)
            vis[i] = 1
        }
    }
    return 0
}

let io = FileIO()
let t = io.readInt()

for _ in 0..<t {
    let n = io.readInt()
    
    var arr = Array(repeating: Array(repeating: 0, count: 0), count: n+1)
    
    for _ in 0..<n-1 {
        let a = io.readInt()
        let b = io.readInt()
        arr[b].append(a)
    }
    
    let a = io.readInt()
    let b = io.readInt()
    print(solve(arr, a, b, n))
}