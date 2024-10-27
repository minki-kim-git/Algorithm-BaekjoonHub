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

var ans = [String]()
var heap = [(0,0)]

func push(_ num: (Int,Int)) {
    heap.append(num)
    var i = heap.count - 1
    
    while i > 1 {
        let p = i / 2
        if heap[i].0 <= heap[p].0 { break }
        heap.swapAt(i, p)
        i = p
    }
 
}

func pop() -> (Int,Int) {
    heap.swapAt(1, heap.count-1)
    let maxn = heap.popLast()!
    
    var i = 1
    while i * 2 < heap.count {
        let lc = i * 2
        let rc = i * 2 + 1
        var maxc = lc
        if rc < heap.count && heap[lc].0 < heap[rc].0 {
            maxc = rc
        }
        if heap[maxc] <= heap[i] { break }
        heap.swapAt(maxc, i)
        i = maxc
    }
    return maxn
}

for i in 1...k {
    push((io.readInt(),i))
}

while heap.count >= 3 {
    let pop1 = pop()
    let pop2 = pop()
    ans.append("\(pop1.1)")
    ans.append("\(pop2.1)")
    
    if pop1.0 - 1 >= 1 {
        push((pop1.0-1, pop1.1))
    }
    if pop2.0 - 1 >= 1 {
        push((pop2.0-1, pop2.1))
    }
}

if heap.count >= 2 {
    if heap[1].0 >= 2 {
        print(-1)
    } else {
        ans.append("\(heap[1].1)")
        print(ans.joined(separator: " "))
    }
} else {
    print(ans.joined(separator: " "))
}