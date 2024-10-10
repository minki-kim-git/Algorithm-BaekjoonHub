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

var heap = [(0,0,0)]
var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
var vis = Array(repeating: Array(repeating: 0, count: m), count: n)

func push(_ num:Int, _ x: Int, _ y: Int) {
    heap.append((num,x,y))
    
    var i = heap.count - 1
    while i > 1 {
        let p = i / 2
        if heap[p].0 > heap[i].0 { break }
        heap.swapAt(i, p)
        i = p
    }
}

func pop() -> (Int,Int) {
    let xy = (heap[1].1,heap[1].2)
    heap.swapAt(1, heap.count-1)
    heap.removeLast()
    swap()
    return xy
}

func swap() {
    var i = 1
    while i * 2 < heap.count {
        let lc = i * 2
        let rc = i * 2 + 1
        var maxc = lc
        if i*2+1 < heap.count && heap[lc].0 < heap[rc].0 {
            maxc = rc
        }
        if heap[maxc].0 < heap[i].0 { break }
        heap.swapAt(maxc, i)
        i = maxc
    }
    
}

func bfs(x:Int,y:Int) {
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    for i in 0..<4 {
        let nx = dx[i] + x
        let ny = dy[i] + y
        if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
        if vis[nx][ny] == 1 { continue }
        vis[nx][ny] = 1
        push(arr[nx][ny], nx, ny)
    }
}

for i in 0..<n {
    for j in 0..<m {
        let a = io.readInt()
        if i == 0 || i == n-1 || j == 0 || j == m-1 {
            vis[i][j] = 1
            push(a, i, j)
        }
        arr[i][j] = a
    }
}

let k = io.readInt()

for _ in 0..<k {
    let pop = pop()
    bfs(x: pop.0, y: pop.1)
    print(pop.0+1,pop.1+1)
}