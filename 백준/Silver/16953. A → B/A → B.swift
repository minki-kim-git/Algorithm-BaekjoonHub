let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = [Int:Int]()
vis[n[0]] = 1
let dx = [0,1]
var queue = [n[0]]
var index = 0
while queue.count > index {
    for i in 0..<2 {
        var dx = 0
        if i == 0 {
             dx = queue[index] * 2
        } else {
             dx = Int(String(queue[index]) + "1")!
        }
        if dx > n[1]  { continue }
        queue.append(dx)
        if let val = vis[dx] {
            vis[dx] = min(val,vis[queue[index]]! + 1)
        } else {
            vis[dx] = vis[queue[index]]! + 1
        }
    }
    index += 1
}
print(vis[n[1]] ?? -1)