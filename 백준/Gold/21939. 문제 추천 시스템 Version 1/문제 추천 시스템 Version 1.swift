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

var dic = [Int:[Int]]()
var listDic = [Int:Int]()

func appendDic(_ p: Int, _ l: Int) {
    if dic[l] == nil {
        dic[l] = [p]
    } else {
        dic[l]!.append(p)
    }
    listDic[p] = l
}

for _ in 0..<n {
    let p = io.readInt()
    let l = io.readInt()
    appendDic(p,l)
}

let m = io.readInt()

for _ in 0..<m {
    let command = io.readString()
    switch command {
    case "add":
        let p = io.readInt()
        let l = io.readInt()
        appendDic(p,l)
    case "recommend":
        let input = io.readInt()
        if input == 1 {
            print(dic.max { $0.key < $1.key }!.value.max()!)
        } else {
            print(dic.max { $0.key > $1.key }!.value.min()!)
        }
    case "solved":
        let s = io.readInt()
        dic[listDic[s]!]!.remove(at: dic[listDic[s]!]!.firstIndex(of: s)!)
        if dic[listDic[s]!]!.isEmpty { dic[listDic[s]!] = nil }
        listDic[s] = nil
    default: break
    }
}