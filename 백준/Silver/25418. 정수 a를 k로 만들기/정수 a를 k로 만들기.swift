let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: 0, count: n[1] + 1)
var queue = [n[0]]
var index = 0

while queue.count > index {
    for i in 0..<2 {
        var num = 0
        if i == 0 {
            num = queue[index] * 2
        } else {
            num = queue[index] + 1
        }
        if num > n[1] || vis[num] != 0 { continue }
        queue.append(num)
        vis[num] = vis[queue[index]] + 1
    }
    index += 1
}

print(vis[n[1]])