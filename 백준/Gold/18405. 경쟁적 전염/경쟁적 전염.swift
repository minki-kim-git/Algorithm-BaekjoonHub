let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: n[0]), count: n[0])
var vis = Array(repeating: Array(repeating: 0, count: n[0]), count: n[0])
var kNum = Array(repeating: Array(repeating: [Int:Int](), count: 0), count:n[1]+1)
for i in 0..<n[0] {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<n[0] {
        arr[i][j] = input[j]
        if input[j] != 0 {
            kNum[input[j]].append([i:j])
        }
    }
}
let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

var index = 0
var s = 0
var queue = [(Int,Int)]()
for i in 1..<kNum.count {
    for j in kNum[i] {
        queue.append((j.first!.key, j.first!.value))
        vis[j.first!.key][j.first!.value] = i
    }
}
var last = (0,0)
if !queue.isEmpty {
    last = (queue.last!)
}

while queue.count > index {
    for i in 0..<4 {
        let nx = dx[i] + queue[index].0
        let ny = dy[i] + queue[index].1
        if nx < 0 || ny < 0 || nx >= n[0] || ny >= n[0] {
            continue
        }
        if vis[nx][ny] != 0 { continue }
        vis[nx][ny] = vis[queue[index].0][queue[index].1]
        queue.append((nx, ny))
    }
    if s == xy[0] { break }
    if queue[index] == last {
        s += 1
        last = queue.last!
        if s == xy[0] {
            break
        }
    }   
    index += 1   
}

print(vis[xy[1]-1][xy[2]-1])