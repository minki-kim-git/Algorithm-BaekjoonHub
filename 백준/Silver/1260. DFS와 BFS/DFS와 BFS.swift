let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[0]+1)
for _ in 0..<n[1] {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[input[0]].append(input[1])
    arr[input[1]].append(input[0])
}
var sortArr = arr.map {
    $0.sorted()
}
func dfs () -> String {
    var vis = Array(repeating: 0, count: n[0]+1)
    var stack = [n[2]]
    var str = ""
    while !stack.isEmpty {
        let top = stack.popLast()!
        if vis[top] != 0 { continue }
        vis[top] = 1
        str += "\(top) "
        for i in sortArr[top].reversed() {
            if vis[i] != 0 { continue }
            stack.append(i)
        }
    }
    str.removeLast()
    return str
}
func bfs() -> String {
    var vis = Array(repeating: 0, count: n[0]+1)
    var queue = [n[2]]
    vis[n[2]] = 1
    var index = 0
    var str = "\(n[2])"
    while queue.count > index {
        for i in sortArr[queue[index]] {
            if vis[i] != 0 { continue }
            queue.append(i)
            vis[i] = 1
            str += " \(i)"
        }
        index += 1
    }
    return str
}
print(dfs())
print(bfs())