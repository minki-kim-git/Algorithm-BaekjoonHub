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

func dfs(h:Int,w:Int,arr:[[String]]) -> Int{
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    var ans = 0
    var vis = Array(repeating: Array(repeating: 0, count: w), count: h)
    var stack = [(Int,Int)]()
    
    for i in 0..<h {
        for j in 0..<w {
            if arr[i][j] == "." || vis[i][j] != 0 { continue }
            stack.append((i, j))
            vis[i][j] = 1
            ans += 1
            while !stack.isEmpty {
                let top = stack.popLast()!
                for i in 0..<4 {
                    let nx = dx[i] + top.0
                    let ny = dy[i] + top.1
                    if nx < 0 || ny < 0 || nx >= h || ny >= w { continue }
                    if vis[nx][ny] != 0 || arr[nx][ny] == "." { continue }
                    stack.append((nx,ny))
                    vis[nx][ny] = 1
                }
            }
        }
    }
    return ans
}

let t = io.readInt()

for _ in 0..<t {
    let h = io.readInt()
    let w = io.readInt()
    var arr = Array(repeating: Array(repeating: "", count: 0), count: h)
  
    for i in 0..<h {
        let input = io.readString().map{String($0)}
        arr[i].append(contentsOf: input)
    }
    
    print(dfs(h: h, w: w, arr: arr))
}