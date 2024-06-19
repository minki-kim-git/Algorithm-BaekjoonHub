var n = Int(readLine()!)!
var vis = Array(repeating: (0,0), count: n+1)
var queue = [n]
var index = 0

while queue.count > index {
    var nx = 0
    for i in 0..<3 {
        switch i {
        case 0:
            if queue[index] % 3 == 0 {
                nx = queue[index] / 3
            } else {
                continue
            }
        case 1:
            if queue[index] % 2 == 0 {
                nx = queue[index] / 2
            } else {
                continue
            }
        default:
            nx = queue[index] - 1
        }
        if nx < 0 || vis[nx].0 != 0 { continue }
        queue.append(nx)
        vis[nx].0 = vis[queue[index]].0 + 1
        vis[nx].1 = queue[index]
    }
    index += 1
}

var ans = ["1"]
var i = 1
for _ in 0..<vis[1].0 {
    ans.append("\(vis[i].1)")
    i = vis[i].1
}

print(vis[1].0)
print(ans.reversed().joined(separator: " "))