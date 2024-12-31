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

let t = io.readInt()

func bfs(_ w:Int, _ h: Int, _ arr: [[String]], _ queue: [(Int,Int,Int)],_ vis: [[Int]]) -> String {
    
    var queue = queue
    var vis = vis
    
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    var index = 0
    
    while queue.count > index {
        for i in 0..<4 {
            let nx = dx[i] + queue[index].0
            let ny = dy[i] + queue[index].1
            if nx < 0 || ny < 0 || nx >= h || ny >= w {
                if queue[index].2 == 0 {
                    return "\(vis[queue[index].0][queue[index].1])"
                }
                continue }
            if arr[nx][ny] == "#" || vis[nx][ny] != 0 {  continue }
            if queue[index].2 == 1 {
                queue.append((nx, ny, 1))
                vis[nx][ny] = -1
            } else {
                queue.append((nx, ny, 0))
                vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
            }
        }
        index += 1
    }
   
    return "IMPOSSIBLE"
}

for _ in 0..<t {
    let w = io.readInt()
    let h = io.readInt()
    var arr = Array(repeating: Array(repeating: "", count: 0), count: h)
    var vis = Array(repeating: Array(repeating: 0, count: w), count: h)
    var queue = [(Int,Int,Int)]()
    var start = (0,0,0)
    for i in 0..<h {
        let input = io.readString().map{String($0)}
        for j in 0..<w {
            if input[j] == "*" {
                queue.append((i, j, 1))
                vis[i][j] = -1
            } else if input[j] == "@" {
                start = (i, j, 0)
                vis[i][j] = 1
            }
            arr[i].append(input[j])
        }
    }
    queue.append(start)
    print(bfs(w, h, arr, queue, vis))
}