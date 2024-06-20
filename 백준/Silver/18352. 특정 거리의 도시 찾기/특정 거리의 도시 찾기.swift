let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: 0, count: n[0]+1)
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[0]+1)
for _ in 0..<n[1] {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[input[0]].append(input[1])
}

var queue = [n[3]]
var index = 0
var ans = [Int]()
vis[n[3]] = 1

while queue.count > index {
    for i in arr[queue[index]] {
        if vis[i] != 0 { continue }
        vis[i] = vis[queue[index]] + 1
        if vis[i] - 1 == n[2] { ans.append(i) }
        queue.append(i)
    }
    index += 1
}

if ans.isEmpty {
    print(-1)
} else {
    _ = ans.sorted().map { print($0) }
}