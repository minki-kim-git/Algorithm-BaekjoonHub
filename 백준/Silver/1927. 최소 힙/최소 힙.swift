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
var sz = 0

func push(_ num:Int) {
    heap.append(num)
    sz += 1
    var i = sz
    while i > 0 {
        var p = i / 2
        if heap[p] < num {
            break
        }
        heap.swapAt(p, i)
        i /= 2
    }
}

func pop() -> Int{
    let ans = heap[1]
    heap[1] = heap.last!
    heap.removeLast()
    sz -= 1
    var i = 1
    while i*2 <= sz {
        let lc = 2 * i
        let rc = 2 * i + 1
        var minc = lc
        if rc <= sz && heap[lc] > heap[rc] {
            minc = rc
        }
        if heap[minc] >= heap[i] { break }
        heap.swapAt(minc, i)
        i = minc
    }
    return ans
}

for _ in 0..<n {
    let x = io.readInt()
    if x == 0 {
        if heap.count == 1 {
            print(0)
        } else {
            print(pop())
        }
    } else {
        push(x)
    }
}