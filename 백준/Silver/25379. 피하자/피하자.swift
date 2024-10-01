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

for _ in 0..<n {
    let num = io.readInt()
    if num % 2 == 1 {
        arr.append(1)
    } else {
        arr.append(0)
    }
}

func minCount(arr:[Int],even:Int, odd: Int) -> Int {
    var start = 0
    var end = n - 1
    var arr = arr
    var count = 0
    while start < end {
        if arr[start] == even {
            start += 1
            continue
        } else {
            if arr[end] == odd {
                end -= 1
                continue
            } else {
                count += end - start
                arr[start] = even
                arr[end] = odd
                start += 1
            }
        }
    }
    return count
}

let r = minCount(arr: arr, even: 1, odd: 0)
let l = minCount(arr: arr, even: 0, odd: 1)

r < l ? print(r) : print(l)