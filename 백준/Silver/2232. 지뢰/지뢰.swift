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
var ans = [Int]()
var dic = [Int:[Int]]()

for i in 0..<n {
    let p = io.readInt()
    if dic[p] != nil {
        dic[p]!.append(i)
    } else {
        dic[p] = [i]
    }
    arr.append(p)
}

func explode(idx:Int) {
    var temp = arr[idx]
    
    for i in idx+1..<n {
        if temp > arr[i] {
            temp = arr[i]
            arr[i] = 0
        } else {
            break
        }
    }
    
    temp = arr[idx]
    
    for i in stride(from: idx-1, through: 0, by: -1) {
        if temp > arr[i] {
            temp = arr[i]
            arr[i] = 0
        } else {
            break
        }
    }
    
    arr[idx] = 0
}

for i in dic.sorted(by: { $0.key > $1.key }) {
    for j in i.value {
        if arr[j] == 0 { continue }
        ans.append(j+1)
        explode(idx: j)
    }
}

_ = ans.sorted().map{ print($0) }