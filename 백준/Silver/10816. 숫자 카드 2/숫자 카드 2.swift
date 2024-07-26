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

var arr = [Int]()
var ans = ""

for _ in 0..<n {
    arr.append(io.readInt())
}

arr = arr.sorted()

let m = io.readInt()

func lowIndex(_ num:Int) -> Int{
    var st = 0
    var en = arr.count
    while st < en {
        let mid = (st + en)/2
        if arr[mid] >= num {
            en = mid
        } else {
            st = mid + 1
        }
    }
    return st
}

func upIndex(_ num:Int) -> Int {
    var st = 0
    var en = arr.count
    while st < en {
        let mid = (st + en)/2
        if arr[mid] > num {
            en = mid
        } else {
            st = mid + 1
        }
    }
    return en
}

for _ in 0..<m {
    let num = io.readInt()
    ans += "\(upIndex(num) - lowIndex(num)) "
}

ans.removeLast()
print(ans)