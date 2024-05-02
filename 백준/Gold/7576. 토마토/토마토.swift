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
let m = io.readInt()
let n = io.readInt()
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)
var queue = [(Int,Int)]()
var index = 0
let dx = [0,1,-1,0]
let dy = [-1,0,0,1]
var max = 1
for i in 0..<n{
    for j in 0..<m {
        let input = io.readInt()
        arr[i].append(input)
        if input == 1 {
            queue.append((i,j))
        }
    }
}
while queue.count > index {
    for i in 0..<4 {
        let nx = dx[i] + queue[index].0
        let ny = dy[i] + queue[index].1
        if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
        if arr[nx][ny] != 0{ continue }
        queue.append((nx,ny))
        arr[nx][ny] = arr[queue[index].0][queue[index].1] + 1
        max = max > arr[nx][ny] ? max : arr[nx][ny]
    }
    index += 1
}
func result() -> Int{
    for i in 0..<n{
        for j in 0..<m {
            if arr[i][j] == 0 {
                return  -1
            }
        }
    }
    return max - 1
}
print(result())