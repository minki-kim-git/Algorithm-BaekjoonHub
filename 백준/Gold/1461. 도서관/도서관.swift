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

var ans = 0
var pbooks = [Int]()
var mbooks = [Int]()

for _ in 0..<n {
    let book = io.readInt()
    if book < 0 {
        mbooks.append(abs(book))
    } else {
        pbooks.append(book)
    }
}

func solve(_ books: [Int], _ m: Int, _ maxNum: Bool) -> Int {
    var i = 0
    var sum = 0
    var count = 0
    
    if maxNum {
        sum += books.first!
        i = m
    }
    
    while i < books.count {
        if count == 0 {
            sum += books[i] * 2
        }
        count += 1
        if count == m { count = 0 }
        i += 1
    }

    return sum
}

pbooks = pbooks.sorted(by: >)
mbooks = mbooks.sorted(by: >)

if pbooks.first ?? 0 > mbooks.first ?? 0 {
    ans += solve(pbooks,m,true)
    ans += solve(mbooks,m,false)
} else {
    ans += solve(pbooks,m,false)
    ans += solve(mbooks,m,true)
}

print(ans)