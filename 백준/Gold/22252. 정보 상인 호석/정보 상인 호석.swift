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
var dic = [String:[Int]]()

func push(_ k: String, _ num: Int) {
    var arr = dic[k]!
    var i = arr.count
    arr.append(num)
    while 1 < i {
        let p = i / 2
        if arr[p] >= arr[i] { break }
        arr.swapAt(p, i)
        i = p
    }
    dic[k] = arr
}

func pop(_ k: String) -> Int {
    var arr = dic[k]!
    arr.swapAt(1, arr.count - 1)
    let maxn = arr.popLast()!
    var i = 1
    
    while i * 2 < arr.count {
        let lc = i * 2
        let rc = i * 2 + 1
        var maxc = lc
        if rc < arr.count && arr[lc] < arr[rc] {
            maxc = rc
        }
        if arr[maxc] < arr[i] { break }
        arr.swapAt(maxc, i)
        i = maxc
    }
    dic[k] = arr
    return maxn
}

for _ in 0..<n {
    let q = io.readInt()
    let k = io.readString()
    if dic[k] == nil { dic[k] = [0] }
    switch q {
    case 1: 
        let c = io.readInt()
        for _ in 0..<c {
            let val = io.readInt()
            push(k, val)
        }
    case 2:
        let b = io.readInt()
        for _ in 0..<b {
            if dic[k]!.count <= 1 { break }
            ans += pop(k)
        }
    default: break
    }
}

print(ans)