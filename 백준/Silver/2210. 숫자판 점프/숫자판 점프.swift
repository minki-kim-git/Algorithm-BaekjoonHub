var arr = Array(repeating: Array(repeating: 0, count: 0), count: 5)
for i in 0..<5 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i].append(contentsOf: input)
}

var stack = [(Int,Int)]()
var strArr = [String]()
var set = Set<String>()
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

for i in 0..<5 {
    for j in 0..<5 {
        stack.append((i,j))
        strArr.append(String(arr[i][j]))
        while !stack.isEmpty {
            let top = stack.popLast()!
            let strTop = strArr.popLast()!
            for i in 0..<4 {
                let nx = dx[i] + top.0
                let ny = dy[i] + top.1
                if nx < 0 || ny < 0 || nx >= 5 || ny >= 5 { continue }
                if strTop.count < 5 {
                    strArr.append(strTop + String(arr[nx][ny]))
                    stack.append((nx,ny))
                } else if strTop.count == 5 {
                    strArr.append(strTop + String(arr[nx][ny]))
                    set.insert(strArr.last!)
                    stack.append((nx,ny))
                } else {
                    continue
                }
            }
        }
    }
}
print(set.count)