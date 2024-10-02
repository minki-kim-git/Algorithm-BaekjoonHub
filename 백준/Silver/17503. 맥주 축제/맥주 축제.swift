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
let k = io.readInt()

var dic = [Int:[Int]]()
var heap = [(0,0)]

for _ in 0..<k {
    let v = io.readInt()
    let c = io.readInt()
    if dic[v] == nil {
        dic[v] = [c]
    } else {
        dic[v]!.append(c)
    }
}

func push(_ v: Int, _ c: Int) {
    heap.append((v,c))
    var i = heap.count - 1
    while i > 1 {
        let p = i / 2
        if heap[p].1 > heap[i].1 { break }
        if heap[p].1 == heap[i].1 && heap[p].0 < heap[i].0 { break }
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
        if rc < heap.count && heap[lc].1 < heap[rc].1 {
            maxc = rc
        }
        if rc < heap.count && heap[lc].1 == heap[rc].1 && heap[lc].0 > heap[rc].0 {
            maxc = rc
        }
        if heap[maxc].1 < heap[i].1 { break }
        if heap[maxc].1 == heap[i].1 && heap[maxc].0 > heap[i].0 { break }
        heap.swapAt(maxc, i)
        i = maxc
    }
    
    return maxn
}

func minLevel() -> Int {
    var sum = 0
    var ans = 2147483648
    
    for i in dic.sorted(by: { $0.key > $1.key }) {
        for j in i.value.sorted(by: >) {
            push(i.key, j)
            sum += i.key
            if heap.count > n {
                if sum < m { return ans }
                ans = min(ans, heap[1].1)
                sum -= pop().0
            }
        }
    }
    return ans
}

let ans = minLevel()
ans == 2147483648 ? print(-1) : print(ans)