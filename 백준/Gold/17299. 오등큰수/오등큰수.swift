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

var arr = [Int]()
var count = Array(repeating: 0, count: 1000001)

for _ in 0..<n {
    let a = io.readInt()
    count[a] += 1
    arr.append(a)
}

func solve(_ n:Int, _ arr: [Int], _ count: [Int]) -> String {
    var stack = [Int]()
    var ans = Array(repeating: "", count: n)
    
    for i in 0..<n {
        while !stack.isEmpty && count[arr[stack.last!]] < count[arr[i]] {
            ans[stack.last!] = "\(arr[i])"
            stack.removeLast()
        }
        stack.append(i)
    }
    
    while !stack.isEmpty {
        ans[stack.popLast()!] = "\(-1)"
    }
    
    return ans.joined(separator: " ")
}

print(solve(n,arr,count))