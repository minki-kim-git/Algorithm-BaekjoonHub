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

func solve(_ w: [String], _ k: Int) -> (Int,Int) {
    var maxn = 0
    var minn = 100000
    var dic = [String:[Int]]()
    if k == 1 { return (1,1) }
    for i in w.enumerated() {
        if let _ = dic[i.element] {
            dic[i.element]!.append(i.offset)
        } else {
            dic[i.element] = [i.offset]
        }
        if dic[i.element]!.count == k {
            let sum = dic[i.element]!.last! - dic[i.element]!.first! + 1
            maxn = max(maxn, sum)
            minn = min(minn,sum)
            dic[i.element]!.removeFirst()
        }
    }
    
    return (minn,maxn)
}

for _ in 0..<t {
    let w = io.readString().map{String($0)}
    let k = io.readInt()
    
    let ans = solve(w, k)
    if ans.1 == 0 {
        print(-1)
    } else {
        print(ans.0, ans.1)
    }
}