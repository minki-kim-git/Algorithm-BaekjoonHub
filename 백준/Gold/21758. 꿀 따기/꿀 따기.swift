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

var sum = 0
var arr = [Int]()

for _ in 0..<n {
    let h = io.readInt()
    sum += h
    arr.append(h)
}

func solve(_ arr:[Int], _ sum: Int) -> Int {
    var maxn = 0
    let firstSum = sum - arr[0]
    var secondSum = firstSum
    for i in 1..<n {
        let firstBee = firstSum - arr[i]
        secondSum -= arr[i]
        maxn = max(maxn,firstBee + secondSum)
    }
    return maxn
}

func fromEnds(_ arr:[Int], _ sum: Int) -> Int {
    var maxn = 0
    var firstSum = 0
    var secondSum = sum - arr.first! - arr.last!
    for i in 1..<n-1 {
        firstSum += arr[i]
        maxn = max(maxn, firstSum + secondSum)
        secondSum -= arr[i]
    }
    return maxn
}

print(max(solve(arr, sum), solve(Array(arr.reversed()), sum),fromEnds(arr, sum)))