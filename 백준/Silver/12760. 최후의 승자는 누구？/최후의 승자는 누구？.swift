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

var arr = Array(repeating: Array(repeating: 0, count: 0), count: n)
var dic = [Int:Int]()
var ans = ""

for i in 1...n {
    dic[i] = 0
    for _ in 0..<m {
        arr[i-1].append(io.readInt())
    }
    arr[i-1] = arr[i-1].sorted(by: >)
}

for i in 0..<m {
    var maxNum = 0
    var score = [Int]()
    for j in 0..<n {
        if arr[j][i] > maxNum {
            score.removeAll()
            maxNum = arr[j][i]
            score.append(j+1)
        } else if arr[j][i] == maxNum {
            score.append(j+1)
        }
        
    }
    for i in score {
        dic[i] = dic[i]! + 1
    }
}

_ = dic.filter {
    $0.value == dic.values.max()!
}.sorted {
    $0.key < $1.key
}.map {
    ans += "\($0.key) "
}

ans.removeLast()
print(ans)