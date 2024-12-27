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

func solve(_ n: Int , _ dic: [Int:[Int]]) -> Int {
    var ans = 0
    var std = [(Int,Int)]()
    
    for i in 1...n {
        if let val = dic[i] {
            _ = val.map { std.append((i, $0)) }
        }
        std = std.sorted { $0.1 > $1.1 }
        while !std.isEmpty {
            if i <= std.last!.1 {
                std.removeLast()
                ans += 1
                break
            }
            std.removeLast()
        }
    }
    return ans
}

let t = io.readInt()

for _ in 0..<t {
    let n = io.readInt()
    let m = io.readInt()
    
    var dic = [Int:[Int]]()
    
    for _ in 0..<m {
        let a = io.readInt()
        let b = io.readInt()
        if dic[a] == nil {
            dic[a] = [b]
        } else {
            dic[a]!.append(b)
        }
    }
    
    print(solve(n, dic))
}