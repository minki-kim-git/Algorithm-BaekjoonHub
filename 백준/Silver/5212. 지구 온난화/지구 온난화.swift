let rc = readLine()!.split(separator: " ").map{Int(String($0))!}
let r = rc[0]
let c = rc[1]

var arr = Array(repeating: Array(repeating: "", count: 0), count: r)
var ans = Array(repeating: Array(repeating: ".", count: c), count: r)

for i in 0..<r {
    let input = readLine()!.map{String($0)}
    arr[i] = input
}

func findX(_ arr:[[String]], _ ans: inout [[String]]) {
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    for i in 0..<r {
        for j in 0..<c {
            if arr[i][j] == "X" {
                var count = 0
                for k in 0..<4 {
                    let nx = dx[k] + i
                    let ny = dy[k] + j
                    if nx < 0 || ny < 0 || nx >= r || ny >= c {
                        count += 1
                        continue
                    }
                    if arr[nx][ny] == "." { count += 1}
                }
                if count < 3 { ans[i][j] = "X"}
            }
        }
    }
}

func trimEdges(_ ans: inout [[String]]) {
    // 상단과 하단에서 "X" 없는 행 제거
    while !ans.first!.contains("X") {
        ans.removeFirst()
    }
    while !ans.last!.contains("X") {
        ans.removeLast()
    }
    
    // 좌측과 우측에서 "X" 없는 열 제거
    while !ans.map({ $0.first! }).contains("X") {
        for i in 0..<ans.count {
            ans[i].removeFirst()
        }
    }
    while !ans.map({ $0.last! }).contains("X") {
        for i in 0..<ans.count {
            ans[i].removeLast()
        }
    }
}

findX(arr, &ans)
trimEdges(&ans)

_ = ans.map { print($0.joined()) }