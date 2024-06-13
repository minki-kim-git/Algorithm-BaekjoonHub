let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let home = readLine()!.split(separator: " ").map{Int(String($0))!}
    var conArr = [(Int,Int)]()
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        conArr.append((input[0], input[1]))
    }
    let rock = readLine()!.split(separator: " ").map{Int(String($0))!}
    conArr.append((rock[0], rock[1]))
    var vis = Array(repeating: 0, count: n+1)
    var queue = [(home[0],home[1])]
    var index = 0
    while queue.count > index {
        for i in 0..<n+1 {
            if vis[i] != 0 { continue }
            let num = abs(conArr[i].0 - queue[index].0) + abs(conArr[i].1 - queue[index].1)
            if num <= 1000 {
                vis[i] = 1
                queue.append((conArr[i].0,conArr[i].1))
            }
        }
        index += 1
    }
    vis.last! == 1 ? print("happy") : print("sad")
}