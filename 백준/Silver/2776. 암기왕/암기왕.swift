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

func bs(_ num: Int, _ arr: [Int]) -> Int {
    var st = 0
    var en = arr.count-1
    while st <= en {
        let mid = (st + en) / 2
        if arr[mid] < num {
            st = mid + 1
        } else if arr[mid] > num {
            en = mid - 1
        } else {
            return 1
        }
    }
    return 0
}

let t = io.readInt()

for _ in 0..<t {
    let n = io.readInt()
    var arr = [Int]()
    for _ in 0..<n {
        arr.append(io.readInt())
    }
    arr = arr.sorted()
    let m = io.readInt()
    for _ in 0..<m {
        print(bs(io.readInt(), arr))
    }
}