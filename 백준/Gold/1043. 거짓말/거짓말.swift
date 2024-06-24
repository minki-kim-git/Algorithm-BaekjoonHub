
let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var truth = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: 0, count: n[0] + 1)
var graph = Array(repeating: Array(repeating: 0, count: 0), count: n[0] + 1)
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[1] + 1)
var visArr = Array(repeating: 0, count: n[1] + 1)
for i in 1...n[1] {
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 1...input[0] {
        graph[input[j]].append(i)
    }
    input.removeFirst()
    arr[i].append(contentsOf: input)
}
var queue = [Int]()
var index = 0
if truth != [0] {
    truth.removeFirst()
    for i in truth {
        if vis[i] != 0 { continue }
        queue.append(i)
        vis[i] = 1
        while queue.count > index {
            for i in graph[queue[index]] {
                visArr[i] = 1
                for j in arr[i] {
                    if vis[j] != 0 { continue }
                    queue.append(j)
                    vis[j] = 1
                }
            }
            index += 1
        }
    }
    print(visArr.filter{$0 == 0}.count-1)
} else {
    print(n[1])
}