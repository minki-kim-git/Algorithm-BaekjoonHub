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
var positiveArr = [Int]()
var negativeArr = [Int]()

for _ in 0..<n {
    let num = io.readInt()
    num >= 0 ? positiveArr.append(num) : negativeArr.append(num)
}

positiveArr = positiveArr.sorted()
negativeArr = negativeArr.sorted(by:>)

var minNum = 2147483647
var ans = [0,0]

func compareNum (aArr: [Int], bArr: [Int]) {
    var aIndex = 0
    var bIndex = 0
    while aIndex < aArr.count {
        let sum = aArr[aIndex] + bArr[bIndex]
        if minNum > abs(sum) {
            ans[0] = aArr[aIndex]
            ans[1] = bArr[bIndex]
            minNum = abs(sum)
        }
        if sum < 0 {
            aIndex += 1
        } else if sum > 0{
            bIndex += 1
            if bIndex == bArr.count { break }
        } else {
            ans[0] = aArr[aIndex]
            ans[1] = bArr[bIndex]
            break
        }
    }
}

if !positiveArr.isEmpty && !negativeArr.isEmpty {
        compareNum(aArr: positiveArr, bArr: negativeArr)
}

if positiveArr.count >= 2 {
    let n = positiveArr[0] + positiveArr[1]
    if minNum > n {
        minNum = n
        ans[0] = positiveArr[0]
        ans[1] = positiveArr[1]
    }
}

if negativeArr.count >= 2 {
    let n = abs(negativeArr[0] + negativeArr[1])
    if minNum > n {
        minNum = n
        ans[0] = negativeArr[1]
        ans[1] = negativeArr[0]
    }
}

let sort = ans.sorted()
print(sort[0],sort[1])