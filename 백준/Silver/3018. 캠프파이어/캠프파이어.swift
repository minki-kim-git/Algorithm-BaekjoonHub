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
let e = io.readInt()

var ans = [1]
var music = 0
var dic = Array(repeating: [Int:Bool](), count: n+1)

func appendmusic(_ arr: [Int]) {
    for i in arr {
        dic[i][music] = true
    }
}

func sharemusic(_ arr: [Int]) {
    for i in arr {
        for j in dic[i] {
            for k in arr {
                dic[k][j.key] = true
            }
        }
    }
}

for _ in 0..<e {
    let k = io.readInt()
    var arr = [Int]()
    var participation = false
    for _ in 0..<k {
        let num = io.readInt()
        if num == 1 {
           music += 1
            participation = true
        } else {
            arr.append(num)
        }
    }
    if participation {
        appendmusic(arr)
    } else {
        sharemusic(arr)
    }
}

for i in dic.enumerated() {
    if i.element.count == music {
        ans.append(i.offset)
    }
}

_ = ans.map { print($0) }