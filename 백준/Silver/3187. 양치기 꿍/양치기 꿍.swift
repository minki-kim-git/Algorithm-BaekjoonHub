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
let r = io.readInt()
let c = io.readInt()

var arr = Array(repeating: Array(repeating: "", count: 0), count: r)
var vis = Array(repeating: Array(repeating: 0, count: c), count: r)

var kans = 0
var vans = 0

for i in 0..<r {
    arr[i].append(contentsOf: io.readString().map{String($0)})
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
var queue = [(Int,Int)]()
var index = 0

for i in 0..<r {
    for j in 0..<c {
        if arr[i][j] == "#" || vis[i][j] != 0 { continue }
        var kCount = 0
        var vCount = 0
        queue.append((i,j))
        vis[i][j] = 1
        if arr[i][j] == "k" {
            kCount += 1
        } else if arr[i][j] == "v" {
            vCount += 1
        }
        while queue.count > index {
            for k in 0..<4 {
                let nx = dx[k] + queue[index].0
                let ny = dy[k] + queue[index].1
                if nx < 0 || ny < 0 || nx >= r || ny >= c { continue }
                if arr[nx][ny] == "#" || vis[nx][ny] != 0 { continue }
                queue.append((nx,ny))
                vis[nx][ny] = 1
                if arr[nx][ny] == "k" {
                    kCount += 1
                } else if arr[nx][ny] == "v" {
                    vCount += 1
                }
            }
            index += 1
        }
        if kCount <= vCount {
            vans += vCount
        } else if kCount > vCount {
            kans += kCount
        } 
    }
}

print(kans,vans)