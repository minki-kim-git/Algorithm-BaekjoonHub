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

var i = 0
var dic = [Int:(Int,Int)]()

func solve(_ std: Int, _ i: Int ) {
    if dic.count < n || dic[std] != nil {
        if let val = dic[std] {
            dic[std] = (val.0+1,val.1)
        } else {
            dic[std] = (1,i)
        }
    } else {
        let min = dic.min {
            if $0.value.0 == $1.value.0 {
                return $0.value.1 < $1.value.1
            }
            return $0.value.0 < $1.value.0
        }!.key
        dic[min] = nil
        dic[std] = (1,i)
    }
}

for _ in 0..<c {
    let std = io.readInt()
    solve(std,i)
    i += 1
}

print(dic.sorted{ $0.key < $1.key }.map{ "\($0.key)" }.joined(separator: " "))