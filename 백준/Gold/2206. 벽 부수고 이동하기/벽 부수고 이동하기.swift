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

var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    arr[i].append(contentsOf: io.readString().map{Int(String($0))!})
}

func solve(_ n:Int, _ m :Int, _ arr: [[Int]]) -> Int {
    
    var vis = Array(repeating: Array(repeating: Array(repeating: 0, count: m), count: n), count: 2)
    var queue = [(0,0,0)]
    vis[0][0][0] = 1
    var index = 0
    let dx = [1,-1,0,0]
    let dy = [0,0,-1,1]
    
    while queue.count > index {
         if queue[index].1 == n-1 && queue[index].2 == m-1 {
             return vis[queue[index].0][queue[index].1][queue[index].2]
         }
        for i in 0..<4 {
            var c = queue[index].0
            let nx = dx[i] + queue[index].1
            let ny = dy[i] + queue[index].2

            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            if vis[c][nx][ny] != 0 { continue }
            if arr[nx][ny] == 1 && c == 1 { continue }

            if arr[nx][ny] == 1 {
                c = 1
                vis[c][nx][ny] = vis[queue[index].0][queue[index].1][queue[index].2] + 1
                queue.append((c,nx,ny))
            } else {
                vis[c][nx][ny] = 1 + vis[c][queue[index].1][queue[index].2]
                queue.append((c,nx,ny))
            }
           
        }
        index += 1
    }
    return -1
}

print(solve(n,m,arr))