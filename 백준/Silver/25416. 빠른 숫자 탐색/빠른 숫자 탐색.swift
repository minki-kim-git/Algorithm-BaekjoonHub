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

var arr = Array(repeating: Array(repeating: 0, count: 0), count: 5)
var vis = Array(repeating: Array(repeating: 0, count: 5), count: 5)

for i in 0..<5 {
    for _ in 0..<5 {
        arr[i].append(io.readInt())
    }
}

let r = io.readInt()
let c = io.readInt()

func bfs() -> Int {
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    var queue = [(r,c)]
    vis[r][c] = 1
    var index = 0
    var count = 0
    
    while queue.count > index {
        for i in 0..<4 {
            let nx = dx[i] + queue[index].0
            let ny = dy[i] + queue[index].1
            if nx < 0 || ny < 0 || nx >= 5 || ny >= 5 { continue }
            if arr[nx][ny] == -1 || vis[nx][ny] != 0 { continue }
            vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
            if arr[nx][ny] == 1 { return vis[nx][ny] - 1 }
            queue.append((nx,ny))
        }
        index += 1
    }
    return -1
}

print(bfs())