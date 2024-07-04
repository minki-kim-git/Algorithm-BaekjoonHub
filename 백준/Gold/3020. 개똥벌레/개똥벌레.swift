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
let h = io.readInt()

var sdic = [Int:Int]()
var jdic = [Int:Int]()

var sMaxNum = 0
var jMaxNum = 0

var sArrSum = Array(repeating: 0, count: h+1)
var jArrSum = Array(repeating: 0, count: h+1)

var sum = 0
var min = 2000000
var ans = 0

for _ in 0..<n/2 {
    let s = io.readInt()
    let j = io.readInt()
    sMaxNum = max(sMaxNum, s)
    jMaxNum = max(jMaxNum, j)
    if let val = sdic[s] {
        sdic[s] = 1 + val
    } else {
        sdic[s] = 1
    }
    if let val = jdic[j] {
        jdic[j] = 1 + val
    } else {
        jdic[j] = 1
    }
    
}

for i in stride(from: sMaxNum, through: 1, by: -1) {
    if let val = sdic[i] {
        sum += val
    }
    sArrSum[i] = sum
}
sum = 0

for i in stride(from: jMaxNum, through: 1, by: -1) {
    if let val = jdic[i] {
        sum += val
    }
    jArrSum[i] = sum
}



for i in 0..<h {
    let sum = sArrSum[i+1] + jArrSum[h-i]
    if sum < min {
        min = sum
        ans = 1
    } else if sum == min {
        ans += 1
    }
}

print(min,ans)