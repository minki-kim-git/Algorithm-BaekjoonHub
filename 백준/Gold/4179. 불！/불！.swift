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
var fqueue = [(Int,Int)]()
var jqueue = [(Int,Int)]()
let r = io.readInt()
let c = io.readInt()
var arr = Array(repeating: Array(repeating: "", count: c), count: r)
var farr = Array(repeating: Array(repeating: 0, count: c), count: r)
var jarr = Array(repeating: Array(repeating: 0, count: c), count: r)
for i in 0..<r{
    let input = io.readString().map { String($0) }
    for j in 0..<c{
        arr[i][j] = input[j]
        switch input[j] {
        case "J":
            jqueue.append((i,j))
            jarr[i][j] = 1
        case "F":
            fqueue.append((i,j))
            farr[i][j] = 1
        default:
           break
        }
    }
}
func bfs(queue: [(Int,Int)], vis: [[Int]]) -> [[Int]] {
    let dx = [0,1,-1,0]
    let dy = [-1,0,0,1]
    var index = 0
    var queue = queue
    var vis = vis
    while queue.count > index {
        for i in 0..<4 {
            let nx = queue[index].0 + dx[i]
            let ny = queue[index].1 + dy[i]
            if nx < 0 || ny < 0 || nx >= r || ny >= c { continue }
            if arr[nx][ny] == "#" || vis[nx][ny] != 0 { continue }
            queue.append((nx,ny))
            vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
        }
        
        index += 1
    }
    return vis
}
farr = bfs(queue: fqueue, vis: farr)
jarr = bfs(queue: jqueue, vis: jarr)
var ans = 99999999
func minNum(i:Int,j:Int){
    if jarr[i][j] == 0 { return }
    if farr[i][j] > jarr[i][j] || farr[i][j] == 0 {
        ans = min(ans, jarr[i][j])
    }
}
for i in 0..<c {
    minNum(i: r-1, j: i)
}
for i in 0..<c {
    minNum(i: 0, j: i)
}
for i in 0..<r {
    minNum(i: i, j: c-1)
}
for i in 0..<r {
    minNum(i: i, j: 0)
}
if ans == 99999999 {
    print("IMPOSSIBLE")
} else {
    print(ans)
}