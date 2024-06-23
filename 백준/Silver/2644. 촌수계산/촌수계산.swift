let n = Int(readLine()!)!
let num = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var vis =  Array(repeating: 0, count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[input[0]].append(input[1])
    arr[input[1]].append(input[0])
}

var queue = [num[0]]
vis[num[0]] = 1
var index = 0

while queue.count > index {
    for i in arr[queue[index]] {
        if vis[i] != 0 { continue }
        vis[i] = vis[queue[index]] + 1
        queue.append(i)
        if i == num[1] { break }
    }
    index += 1
}

vis[num[1]] == 0 ? print(-1) : print(vis[num[1]]-1)