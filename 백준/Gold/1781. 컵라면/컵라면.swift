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

var heap = [0]
var hs = 0
var ans = 0
var arr = Array(repeating: Array(repeating: 0, count: 0), count: 200001)
var dmax = 0

for _ in 0..<n {
    let d = io.readInt()
    let w = io.readInt()
    arr[d].append(w)
    dmax = max(d,dmax)
}
func push(_ num: Int) {
    heap.append(num)
    hs += 1
    var i = hs
    
    while i > 1 {
        let p = i / 2
        if heap[p] > heap[i] { break }
        heap.swapAt(p, i)
        i = p
    }
}

func pop() -> Int {
    heap.swapAt(1, hs)
    hs -= 1
    let maxNum = heap.popLast()!
    var i = 1
    
    while i*2 <= hs {
        let lc = i * 2
        let rc = i * 2 + 1
        var maxc = lc
        if rc <= hs && heap[lc] < heap[rc] {
            maxc = rc
        }
        if heap[maxc] < heap[i] { break }
        heap.swapAt(maxc, i)
        i = maxc
    }
    return maxNum
}

for i in stride(from: dmax, through: 1, by: -1) {
    for j in arr[i] {
        push(j)
    }
    if heap.count == 2 {
        ans += heap.popLast()!
        hs -= 1
    } else if heap.count > 2 {
        ans += pop()
    }
}

print(ans)