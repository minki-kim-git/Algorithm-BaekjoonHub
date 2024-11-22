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

var ans = 0
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    let input = io.readString().map{String($0)}
    for j in 0..<n {
        if input[j] == "Y" {
            arr[i].append(j)
        }
    }
}

func countFriends(_ arr: [[Int]],_ idx: Int) -> Int {
    var vis = Array(repeating: 0, count: n)
    for i in arr[idx] {
        if vis[i] == 0 { vis[i] = 1 }
        for j in arr[i] {
            if vis[j] != 0 || j == idx { continue }
            vis[j] = 1
        }
    }
    return vis.filter { $0 == 1 }.count
}

for i in 0..<n {
    let count = countFriends(arr,i)
    if count > ans { ans = count }
}

print(ans)