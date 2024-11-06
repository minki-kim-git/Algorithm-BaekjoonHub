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

func solve(_ n:Int, _ m:Int, _ k:Int, _ arr:[Int]) -> Int {
    
    if n == m && arr.reduce(0,+) < k { return 1 }
   
    var ans = 0
    var sum = 0
    var st = 0
    var en = 0
    var count = 0
    
    while st < n {
        if count < m {
            sum += arr[en]
            en += 1
            if en == n { en = 0 }
            count += 1
        } else {
            if sum < k { ans += 1 }
            count -= 1
            sum -= arr[st]
            st += 1
        }
    }
    return ans
}

for _ in 0..<t {
    let n = io.readInt()
    let m = io.readInt()
    let k = io.readInt()
    
    var arr = [Int]()
    
    for _ in 0..<n {
        arr.append(io.readInt())
    }
    print(solve(n,m,k,arr))
}