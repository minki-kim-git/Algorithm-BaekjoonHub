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
let a = io.readInt()
let b = io.readInt()
var arrA = [Int]()
var arrB = [Int]()

for _ in 0..<a {
    arrA.append(io.readInt())
}
for _ in 0..<b {
    arrB.append(io.readInt())
}

var aIndex = 0
var bIndex = 0
var ans = ""

while aIndex + bIndex < a + b {
    if aIndex == a {
        ans += "\(arrB[bIndex]) "
        bIndex += 1
    } else if bIndex == b {
        ans += "\(arrA[aIndex]) "
         aIndex += 1
    } else {
        if arrA[aIndex] <= arrB[bIndex] {
            ans += "\(arrA[aIndex]) "
            aIndex += 1
        } else {
            ans += "\(arrB[bIndex]) "
            bIndex += 1
        }
    }
}
ans.removeLast()
print(ans)