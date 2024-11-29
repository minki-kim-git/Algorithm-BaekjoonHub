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


var rank = 1
var arr = [String]()
var dic = [String:[Int]]()
var rankdic = [String:Int]()

func solve(_ arr:[String], _ dic:[String:Int]) -> String{
    var stack = [String]()
    var rank = 1
    func processStack() {
        while !stack.isEmpty && dic[stack.last!] == rank{
            stack.removeLast()
            rank += 1
        }
    }
    for str in arr {
        processStack()
        stack.append(str)
        processStack()
    }
    if rank == n * 5 + 1 {
        return "GOOD"
    }
    return "BAD"
}

for _ in 0..<n*5 {
    let input = io.readString()
    arr.append(input)
    let str = input.split(separator: "-")
    if let _ = dic[String(str[0])] {
        dic[String(str[0])]!.append(Int(str[1])!)
    } else {
        dic[String(str[0])] = [Int(str[1])!]
    }
}

for i in dic.sorted(by: { $0.key < $1.key }) {
    for j in i.value.sorted() {
        rankdic["\(i.key)-\(j)"] = rank
        rank += 1
    }
}

print(solve(arr, rankdic))