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
var vis = Array(repeating: Array(repeating: 0, count: n), count: n)
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    for _ in 0..<n {
        arr[i].append(io.readInt())
    }
}

func bfs() -> String {
    var queue = [(0,0)]
    var index = 0
    while queue.count > index {
        for i in 0..<2 {
            var nx = queue[index].0
            var ny = queue[index].1
            if i == 0 {
                nx = arr[queue[index].0][queue[index].1] + queue[index].0
            } else {
                ny = arr[queue[index].0][queue[index].1] + queue[index].1
            }
            if nx >= n || ny >= n || vis[nx][ny] != 0 { continue }
            if arr[nx][ny] == -1 {
                return "HaruHaru"
                }
            queue.append((nx,ny))
            vis[nx][ny] = 1
        }
        index += 1
    }
    return "Hing"
}
print(bfs())