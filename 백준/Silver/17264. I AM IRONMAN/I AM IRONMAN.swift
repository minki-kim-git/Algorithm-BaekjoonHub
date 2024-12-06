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
let p = io.readInt()

let w = io.readInt()
let l = io.readInt()
let g = io.readInt()

var arr = [String]()
var dic = [String:Int]()

for _ in 0..<p {
    let name = io.readString()
    let wl = io.readString()
    if wl == "W" {
        dic[name] = w
    } else {
        dic[name] = -l
    }
}

for _ in 0..<n {
    arr.append(io.readString())
}

func solve(_ arr:[String], _ dic: [String:Int], _ l: Int ,_ g: Int) -> String {
    var sum = 0
    for i in arr {
        if let val = dic[i] {
            sum += val
            if sum >= g { return "I AM NOT IRONMAN!!" }
        } else {
            sum -= l
        }
        if sum < 0 { sum = 0 }
    }
    return "I AM IRONMAN!!"
}

print(solve(arr, dic, l, g))