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

let b = io.readInt()
let c = io.readInt()
let d = io.readInt()

var arrb = [Int]()
var arrc = [Int]()
var arrd = [Int]()
var setCount = min(b,c,d)
var sum = 0
var setsum = 0

func minPrice(arr: [Int]) {
    var count = setCount
    for i in arr.sorted(by: >) {
        sum += i
        if count > 0 {
            count -= 1
            setsum += Int(Double(i) * 0.9)
        } else {
            setsum += i
        }
    }
}

for _ in 0..<b {
    arrb.append(io.readInt())
}

for _ in 0..<c {
    arrc.append(io.readInt())
}


for _ in 0..<d {
    arrd.append(io.readInt())
}

minPrice(arr: arrb)
minPrice(arr: arrc)
minPrice(arr: arrd)

print(sum,setsum)