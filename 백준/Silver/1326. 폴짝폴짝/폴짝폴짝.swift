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

var arr = [Int]()
var vis = Array(repeating: 0, count: n)

for _ in 0..<n {
    arr.append(io.readInt())
}

let a = io.readInt() - 1
let b = io.readInt() - 1

var queue = [a]
var index = 0
vis[a] = 1

if a != b {
    while queue.count > index {
        for i in stride(from: queue[index], to: n, by: arr[queue[index]]) {
            if i  > n - 1  { break }
            if vis[i] != 0 { continue }
            vis[i] = vis[queue[index]] + 1
            queue.append(i)
        }
        for i in stride(from: queue[index], through: 0, by: -arr[queue[index]]) {
            if i < 0 { break }
            if vis[i] != 0 { continue }
            vis[i] = vis[queue[index]] + 1
            queue.append(i)
        }
        index += 1
    }
    
}

vis[b] == 0 ? print(-1) : print(vis[b]-1)