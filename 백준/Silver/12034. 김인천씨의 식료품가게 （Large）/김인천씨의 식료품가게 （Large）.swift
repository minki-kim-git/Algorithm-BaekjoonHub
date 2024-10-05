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

let t = io.readInt()

for i in 1...t {
    
    let n = io.readInt()
    
    var ans = [String]()
    var arr = [Int]()
    var dic = [Int:Int]()
    
    for _ in 0..<n*2 {
        let input = io.readInt()
        arr.append(input)
        if let val = dic[input] {
            dic[input] = 1 + val
        } else {
            dic[input] = 1
        }
    }
    
    for j in arr.reversed() {
        if dic[j]! > 0 {
            let price = j - j / 4
            dic[price]! = dic[price]! - 1
            ans.append("\(price)")
            dic[j]! = dic[j]! - 1
        }
    }
    print("Case #\(i): \(ans.reversed().joined(separator: " "))")
}