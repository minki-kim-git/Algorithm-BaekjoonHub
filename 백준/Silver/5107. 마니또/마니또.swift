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

func solve(_ dic:[String:String]) -> Int {
    var ans = 0
    var vis = [String:Int]()
    
    for i in dic {
        if vis[i.key] == 1 { continue }
        var stack = [i.key]
        while !stack.isEmpty {
            let top = stack.popLast()!
            if vis[top] == 1 { continue }
            stack.append(dic[top]!)
            vis[top] = 1
        }
        ans += 1
    }
    return ans
}

let io = FileIO()
var i = 1

while true {
    let n = io.readInt()
    if n == 0 { break }
    var dic = [String:String]()
    
    for _ in 0..<n {
        let a = io.readString()
        let b = io.readString()
        dic[a] = b
    }
    print(i,solve(dic))
    i += 1
}