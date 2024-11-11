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
let d = io.readInt()
let k = io.readInt()
let c = io.readInt()

var st = 0
var en = 0
var ans = 0
var count = 0
var arr = [Int]()
var dic = [Int:Int]()

for _ in 0..<n {
    arr.append(io.readInt())
}

while st < n {
    if count == k {
        if dic[c] != nil {
            if dic.count > ans { ans = dic.count }
        } else {
            if dic.count + 1 > ans { ans = dic.count + 1 }
        }
        
        if dic[arr[st]] == 1 {
            dic[arr[st]] = nil
        } else {
            dic[arr[st]] = dic[arr[st]]! - 1
        }
        
        st += 1
        count -= 1
    } else {
        if let val = dic[arr[en]] {
            dic[arr[en]] = val + 1
        } else {
            dic[arr[en]] = 1
        }
        
        en += 1
        count += 1
        if en == n { en = 0 }
    }
}

print(ans)