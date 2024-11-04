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

var arr = Array(repeating: Array(repeating: "", count: 0), count: n)

for i in 0..<n {
    arr[i].append(contentsOf:io.readString().map{String($0)})
}

func dfs(_ n: Int, _ m: Int, _ arr: [[String]]) -> Int {
    var idx = 0
    var ans = 0
    var vis = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        for j in 0..<m {
            if vis[i][j] != 0 { continue }
            var stack = [(i,j)]
            idx += 1
            vis[i][j] = idx
            while !stack.isEmpty {
                let top = stack.popLast()!
                var dx = top.0
                var dy = top.1
                switch arr[top.0][top.1] {
                case "U": dx -= 1
                case "D": dx += 1
                case "L": dy -= 1
                case "R": dy += 1
                default : break
                }

                if vis[dx][dy] == 0 {
                    vis[dx][dy] = idx
                } else if vis[dx][dy] == idx {
                    ans += 1
                    break
                } else {
                    break
                }
                stack.append((dx, dy))
            }
        }
    }
    return ans
}

print(dfs(n,m,arr))