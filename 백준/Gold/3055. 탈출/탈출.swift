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

var d = (0,0)
var wqueue = [(Int,Int)]()
var squeue = [(Int,Int)]()
var arr = Array(repeating: Array(repeating: "", count: c), count: r)
var vis = Array(repeating: Array(repeating: (0,0), count: c), count: r)

for i in 0..<r {
    let input = io.readString().map{String($0)}
    for j in 0..<c {
        arr[i][j] = input[j]
        switch input[j] {
        case "*":
            wqueue.append((i, j))
            vis[i][j].0 = 1
        case "S":
            squeue.append((i, j))
            vis[i][j].1 = 1
        case "D":
            d = (i,j)
        default: break
        }
    }
}

var index = 0
let dx = [-1,1,0,0]
let dy = [0,0,1,-1]

while wqueue.count > index {
    for i in 0..<4 {
        let nx = dx[i] + wqueue[index].0
        let ny = dy[i] + wqueue[index].1
        if nx < 0 || ny < 0 || nx >= r || ny >= c { continue }
        if vis[nx][ny].0 != 0 || arr[nx][ny] == "X" || arr[nx][ny] == "D" { continue }
        vis[nx][ny].0 = vis[wqueue[index].0][wqueue[index].1].0 + 1
        wqueue.append((nx, ny))
    }
    index += 1
}

index = 0

while squeue.count > index {
    for i in 0..<4 {
        let nx = dx[i] + squeue[index].0
        let ny = dy[i] + squeue[index].1
        if nx < 0 || ny < 0 || nx >= r || ny >= c { continue }
        if vis[nx][ny].1 != 0 || arr[nx][ny] == "X"  { continue }
        if vis[nx][ny].0 != 0 && vis[nx][ny].0 <= vis[squeue[index].0][squeue[index].1].1 + 1 { continue }
        vis[nx][ny].1 = vis[squeue[index].0][squeue[index].1].1 + 1
        if arr[nx][ny] == "D" { break }
        squeue.append((nx, ny))
    }
    index += 1
}

vis[d.0][d.1].1 == 0 ? print("KAKTUS") : print(vis[d.0][d.1].1 - 1)