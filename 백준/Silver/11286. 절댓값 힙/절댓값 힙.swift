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

func push(_ num:Int) {
    heap.append(num)
    var i = heap.count - 1
    while i > 1 {
        let p = i / 2
        if abs(heap[i]) > abs(heap[p]) { break }
        if abs(heap[i]) == abs(heap[p]) && heap[i] > heap[p] { break }
        heap.swapAt(i, p)
        i = p
    }
}

func top() -> Int {
    return heap[1]
}

func pop() {
    heap.swapAt(1, heap.count-1)
    heap.removeLast()
    var i = 1
    while i*2 < heap.count {
        let lc = i * 2
        let rc = i * 2 + 1
        var minc = lc
        if rc < heap.count && abs(heap[lc]) >= abs(heap[rc]) {
            if abs(heap[lc]) == abs(heap[rc]) {
                if heap[lc] > heap[rc] {
                    minc = rc
                }
            } else {
                minc = rc
            }
        }
        if abs(heap[minc]) > abs(heap[i]) { break }
        if abs(heap[minc]) == abs(heap[i]) && heap[minc] > heap[i] { break }
        heap.swapAt(minc, i)
        i = minc
    }
}

for _ in 0..<n {
    let x = io.readInt()
    if x == 0 {
        if heap.count == 1 {
            print(0)
        } else {
            print(top())
            pop()
        }
    } else {
        push(x)
    }
}