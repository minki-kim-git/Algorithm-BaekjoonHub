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
let l = io.readInt()
let r = io.readInt()

var ans = 0
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    for _ in 0..<n {
        arr[i].append(io.readInt())
    }
}

func bfs(_ n: Int ,_ arr: [[Int]]) -> [[(Int,Int)]] {
    var coordinates = [[(Int,Int)]]()
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    var vis = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0..<n {
        for j in 0..<n {
            if vis[i][j] != 0 { continue }
            var coordinate = [(Int,Int)]()
            var queue = [(i,j)]
            var index = 0
            vis[i][j] = 1
            
            while queue.count > index {
                for i in 0..<4 {
                    let nx = dx[i] + queue[index].0
                    let ny = dy[i] + queue[index].1
                    
                    if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
                    if vis[nx][ny] != 0 { continue }
                    let sum = abs(arr[queue[index].0][queue[index].1] - arr[nx][ny])
                    if !(sum >= l && sum <= r) { continue }
                    
                    queue.append((nx, ny))
                    coordinate.append((nx, ny))
                    vis[nx][ny] = 1
                }
                index += 1
            }
            if coordinate.count >= 1 { 
                coordinate.append((queue[0]))
                coordinates.append(coordinate)
            }
        }
    }
    return coordinates
}

func updatearr(_ coordinates:[[(Int,Int)]], _ arr: [[Int]]) -> [[Int]] {
    var arr = arr
    for i in 0..<coordinates.count {
        var sum = 0
        
        for j in coordinates[i] {
            sum += arr[j.0][j.1]
        }
        
        sum /= coordinates[i].count

        for j in coordinates[i] {
            arr[j.0][j.1] = sum
        }
    }
    return arr
}

while true {
    let result = bfs(n,arr)
    if result.count == 0 { break }
    arr = updatearr(result,arr)
    ans += 1
}

print(ans)