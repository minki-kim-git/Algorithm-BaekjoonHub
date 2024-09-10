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

var dic = [Int:[Int]]()
var sum = 0

for _ in 0..<n {
    let w = io.readInt()
    let p = io.readInt()
    sum += w
    if let _ = dic[p] {
        dic[p]!.append(w)
    } else {
        dic[p] = [w]
    }
}

func minPrice() -> Int {
    var ans = 2147483648
    var temp = sum
    
    for i in dic.sorted(by: { $0.key > $1.key }) {
        temp -= i.value.reduce(0,+)
        var minus = 0
        
        for j in i.value.sorted(by: >).enumerated() {
            temp += j.element
            minus += j.element
            
            if temp >= m {
                let num = i.key * (j.offset + 1)
                if num <= ans {
                    ans = num
                } else {
                    return ans
                }
                break
            }
            
        }
        
        temp -= minus
        if temp < m && ans == 2147483648 { return -1 }
    }
    
    return ans
}

print(minPrice())