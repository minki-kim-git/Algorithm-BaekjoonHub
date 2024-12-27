
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
let c = io.readInt()
let m = io.readInt()

var dic = [Int:[Int:Int]]()

for _ in 0..<m {
    let s = io.readInt()
    let r = io.readInt()
    let c = io.readInt()
    if dic[s] == nil {
        dic[s] = [r:c]
    } else {
        dic[s]![r] = c
    }
}

func solve( _ n: Int, _ c: Int, _ dic: [Int:[Int:Int]]) -> Int{
    var ans = 0
    var sum = 0
    var box = Array(repeating: 0, count: n+1)
    
    for i in 1...n {
        ans += box[i]
        sum -= box[i]
        box[i] = 0
        
        for j in dic[i]?.sorted(by: { $0.key < $1.key }) ?? [] {
            var val = j.value
            if c < val {
                val = c
            }
            box[j.key] += val
            sum += val
            if sum > c {
                for k in stride(from: n, through: 1, by: -1) {
                    if box[k] != 0 {
                        if sum - box[k] >= c {
                            sum -= box[k]
                            box[k] = 0
                        } else { 
                            box[k] -= sum - c
                            sum = c
                        }
                    }
                    if sum <= c { break }
                }
            }
        }
    }
    return ans
}

print(solve(n, c, dic))