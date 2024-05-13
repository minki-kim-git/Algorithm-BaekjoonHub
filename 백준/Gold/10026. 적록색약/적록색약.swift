func dfsAlphabet(word: String, blindness: Bool) {
    while !stack.isEmpty {
        let top = stack.popLast()!
        for i in 0..<4 {
            let nx = dx[i] + top.0
            let ny = dy[i] + top.1
            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                continue
            }
            if vis[nx][ny] != 0 { continue }
            if blindness {
                switch  word {
                case "B":
                    if arr[nx][ny] != word { continue }
                default:
                    if arr[nx][ny] == "B" { continue }
                }
            } else {
                if arr[nx][ny] != word { continue }
            }
            stack.append((nx,ny))
            if blindness {
                switch word {
                case "B":
                    vis[nx][ny] = 2
                default:
                    vis[nx][ny] = 3
                }
            } else {
                switch word {
                case "R":
                    vis[nx][ny] = 1
                case "B":
                    vis[nx][ny] = 2
                default:
                    vis[nx][ny] = 3
                }
            }
        }
    }
}
func divideColor(blindness: Bool) -> Int {
    var count = 0
    for i in 0..<n {
        for j in 0..<n {
            if vis[i][j] != 0 { continue }
            stack.append((i,j))
            dfsAlphabet(word: arr[i][j], blindness: blindness)
            count += 1
        }
    }
    return count
}

var stack = [(Int,Int)]()
let dx = [1,0,0,-1]
let dy = [0,1,-1,0]
let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: "", count: 0), count: n)
var vis = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    let input = readLine()!.map{String(($0))}
    arr[i].append(contentsOf: input)
}

print(divideColor(blindness: false),terminator: " ")
vis = Array(repeating: Array(repeating: 0, count: n), count: n)
print(divideColor(blindness: true))