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
var arr = [Int]()
var dic = [Int:Int]()
var start = 0
var end = 0
var i = 0

for _ in 0..<m {
    dic[io.readInt()] = 1
}

for i in 1...n {
    if dic[i] == nil {
        arr.append(i)
    }
}

while i < arr.count {
    start = arr[i]
    end = arr[i]
    
    for j in i+1..<arr.count {
        if arr[j] - arr[i] <= 3 {
            i = j
            end = arr[j]
        } else {
            break
        }
    }
    
    if start == end {
        ans += 5 + 2
    } else {
        ans += 5 + 2 * (end - start + 1)
    }
    i += 1
}

print(ans)