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

var carr = [Int]()
var heap = [0]

func push(_ height: Int) {
    heap.append(height)
    var i = heap.count - 1
    while i > 1 {
        let p = i / 2
        if heap[p] > heap[i] { break }
        heap.swapAt(p, i)
        i = p
    }
}

func pop() -> Int {
    heap.swapAt(1, heap.count - 1)
    let top = heap.popLast()!
    var i = 1
    while i*2 < heap.count {
        let lc = i * 2
        let rc = i * 2 + 1
        var maxc = lc
        if rc < heap.count && heap[lc] < heap[rc] {
            maxc = rc
        }
        if heap[maxc] <= heap[i] {
            break
        }
        heap.swapAt(maxc, i)
        i = maxc
    }
    return top
}

for _ in 0..<n {
    push(io.readInt())
}

for _ in 0..<m {
    carr.append(io.readInt())
}

func ans() -> Int {
    for i in carr {
        guard heap.count > 1 else { return 0 } 
        let top = pop()
        if top < i {
            return 0
        }
        push(top - i)    
    }
    return 1
}

print(ans())
