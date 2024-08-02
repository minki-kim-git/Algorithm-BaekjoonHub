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

var t = [Int]()
var arr = [Int]()

for _ in 0..<n {
    arr.append(io.readInt())
}

arr = arr.sorted()

for i in arr {
    for j in arr {
        t.append(i+j)
    }
}

t = t.sorted()

func bs(_ num:Int) -> Bool {
    var st = 0
    var en = t.count - 1
    while st <= en {
        let mid = (st+en)/2
        if t[mid] > num {
            en = mid - 1
        } else if t[mid] < num {
            st = mid + 1
        } else {
            return true
        }
    }
    return false
    
}

func optimal() -> Int {
    for i in arr.reversed() {
        for j in arr {
            if bs(i - j) {
                return i
            }
        }
    }
    return 0
}

print(optimal())