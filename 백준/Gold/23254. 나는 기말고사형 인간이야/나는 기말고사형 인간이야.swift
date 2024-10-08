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

var ans = 0
var temp = [Int]()
var arr = Array(repeating: Array(repeating: 0, count: 0), count: 101)

for _ in 0..<m {
    let a = io.readInt()
    ans += a
    temp.append(a)
}

for i in 0..<m {
    let b = io.readInt()
    arr[b].append(temp[i])
}

func maxScore() -> Int {
    var count = n * 24
    for i in stride(from: 100, through: 1, by: -1) {
        var idx = 0
        while arr[i].count > idx {
            
            let divn = (100 - arr[i][idx]) / i
            let score = divn * i + arr[i][idx]
            
            if divn < count {
                count -= divn
                ans += divn * i
            } else {
                ans += i * count
                return ans
            }
            
            if score < 100 {
                arr[100-score].append(score)
            }
            
            idx += 1
        }
    }
    return ans
}

print(maxScore())