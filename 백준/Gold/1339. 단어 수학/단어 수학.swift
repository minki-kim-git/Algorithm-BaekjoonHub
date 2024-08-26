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

var scoreDic = [Character:Int]()
var nDic = [Character:String]()
var arr = [String]()
var num = 9
var ans = 0

for _ in 0..<n {
    let input = io.readString()
    arr.append(input)
    var idx = 1
    for i in String(input.reversed()) {
        if let val = scoreDic[i] {
            scoreDic[i] = val + idx
        } else {
            scoreDic[i] = idx
        }
        idx *= 10
    }
}

for i in (scoreDic.sorted(by: { $0.value > $1.value})) {
    nDic[i.key] = String(num)
    num -= 1
}

for i in arr {
    var strnum = ""
    for j in i {
        strnum += nDic[j]!
    }
    ans += Int(strnum)!
}

print(ans)