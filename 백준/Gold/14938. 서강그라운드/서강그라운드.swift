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
let r = io.readInt()

var ans = 0
var items = [0]
var arr = Array(repeating: Array(repeating: (0,0), count: 0), count: n+1)

for _ in 0..<n {
    items.append(io.readInt())
}

for _ in 0..<r {
    let a = io.readInt()
    let b = io.readInt()
    let r = io.readInt()
    
    arr[a].append((b,r))
    arr[b].append((a,r))
}

for i in 1...n {
    var sum = items[i]
    var range = Array(repeating: 0, count: n+1)
    var queue = [i]
    var index = 0

    while queue.count > index {
        for j in arr[queue[index]] {
            if i == j.0 { continue }
            if range[queue[index]] + j.1 > m { continue }
            if range[j.0] == 0 {
                queue.append(j.0)
                sum += items[j.0]
                range[j.0] = range[queue[index]] + j.1
            }
            else if range[j.0] > range[queue[index]] + j.1 {
                queue.append(j.0)
                range[j.0] = range[queue[index]] + j.1
            }
         }
        index += 1
    }
    if ans < sum { ans = sum }
}

print(ans)