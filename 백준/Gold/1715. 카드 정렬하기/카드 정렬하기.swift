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
var hz = 0
var ans = 0

func push(_ num: Int) {
    heap.append(num)
    hz += 1
    var i = hz
    
    while i > 0 {
        let p = i / 2
        if heap[p] < heap[i] { break }
        heap.swapAt(p, i)
        i /= 2
    }
    
}

func pop() -> Int {
    heap.swapAt(hz, 1)
    let num = heap.popLast()!
    hz -= 1
    var i = 1
    
    while i*2 <= hz {
        let lc = i * 2
        let rc = i * 2 + 1
        var minc = lc
        if rc <= hz && heap[lc] > heap[rc] {
            minc = rc
        }
        if heap[minc] >= heap[i] { break }
        heap.swapAt(minc, i)
        i = minc
    }
    return num
}

for _ in 0..<n {
    push(io.readInt())
}

while heap.count > 2 {
    let minNum = pop() + pop()
    ans += minNum
    push(minNum)
}

print(ans)