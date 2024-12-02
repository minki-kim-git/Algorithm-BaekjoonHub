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

let s = io.readInt()
let p = io.readInt()

var dna = io.readString().map{String($0)}

var ans = 0
var dic = ["A":0, "C":0, "G":0,"T":0]

var mins = [String:Int]()

mins["A"] = io.readInt()
mins["C"] = io.readInt()
mins["G"] = io.readInt()
mins["T"] = io.readInt()

var st = 0
var en = 0
var len = 0

while en <= s {
    if len < p {
        dic[dna[en]] = 1 + dic[dna[en]]!
        len += 1
        en += 1
    } else {
        if dic["A"]! >= mins["A"]! && dic["C"]! >= mins["C"]! && dic["G"]! >= mins["G"]! && dic["T"]! >= mins["T"]! {
            ans += 1
        }
        dic[dna[st]] = dic[dna[st]]! - 1
        st += 1
        len -= 1
        if en == s { break }
    }
}

print(ans)