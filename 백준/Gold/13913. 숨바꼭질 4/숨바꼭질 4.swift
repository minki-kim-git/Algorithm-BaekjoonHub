let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: (0,0), count: max(n[1],n[0]) + 2)
var queue = [n[0]]
var index = 0
vis[n[0]].0 = 1
while queue.count > index {
    for i in 0...2 {
        var nx = queue[index]
        switch i {
        case 0:
            nx *= 2
        case 1:
            nx += 1
        case 2:
            nx -= 1
        default: break
        }
        if nx < 0 || nx >= vis.count { continue }
        if vis[nx].0 != 0 { continue }
         
        queue.append(nx)
        vis[nx].0 = vis[queue[index]].0 + 1
        vis[nx].1 = queue[index]
    }
    index += 1
}

var ans = [n[1]]
index = vis[n[1]].1
for _ in 0..<vis[n[1]].0-1 {
    ans.append(index)
    index = vis[index].1
}
var result = ""
_ = ans.reversed().map {
    result += "\($0) "
}
result.removeLast()
print(vis[n[1]].0-1)
print(result)