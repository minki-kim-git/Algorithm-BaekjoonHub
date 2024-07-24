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
let k = io.readInt()

var jewel = [(Int,Int)]()
var bag = [Int]()
var heap = [0]
var ans = 0
var bi = 0
var ji = 0

for _ in 0..<n {
    jewel.append((io.readInt(), io.readInt()))
}

for _ in 0..<k {
    bag.append(io.readInt())
}

jewel = jewel.sorted{ $0.0 < $1.0 }
bag = bag.sorted()

func push(_ num: Int) {
    heap.append(num)
    var i = heap.count - 1
    while i > 1 {
        let p = i / 2
        if heap[p] > heap[i] { break }
        heap.swapAt(p, i)
        i = p
    }
}

func pop() -> Int{
    heap.swapAt(1, heap.count-1)
    let mn = heap.popLast()!
    var i = 1
    while i * 2 < heap.count {
        let lc = i * 2
        let rc = i * 2 + 1
        var maxc = lc
        if rc < heap.count && heap[lc] < heap[rc] {
            maxc = rc
        }
        if heap[maxc] <= heap[i] { break }
        heap.swapAt(maxc, i)
        i = maxc
    }
    return mn
}

while ji < jewel.count {
    if jewel[ji].0 <= bag[bi] {
        push(jewel[ji].1)
        ji += 1
        if ji == jewel.count {
            while bi < bag.count {
                if heap.count > 1 {
                    ans += pop()
                }
                bi += 1
            }
        }
    } else {
        if heap.count > 1 {
            ans += pop()
        }
        bi += 1
        if bi == bag.count { break }
    }
}

print(ans)