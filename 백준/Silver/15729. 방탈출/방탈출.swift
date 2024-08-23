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
var ans = 0
var button = Array(repeating: 0, count: n)
var i = 0

for _ in 0..<n {
    arr.append(io.readInt())
}

func onoff(idx: Int) {
    for i in 0..<3 {
        if i+idx >= n { break }
        if button[i+idx] == 0 {
            button[i+idx] = 1
        } else {
            button[i+idx] = 0
        }
    }
}

while i < n {
    if arr[i] == 1 && button[i] == 0 {
        onoff(idx: i)
        ans += 1
    } else if arr[i] == 0 && button[i] == 1 {
        onoff(idx: i)
        ans += 1
    }
    i += 1
}

print(ans)