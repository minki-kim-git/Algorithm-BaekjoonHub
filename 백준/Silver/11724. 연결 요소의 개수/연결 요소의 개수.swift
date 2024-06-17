let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var vis = Array(repeating: 0, count: n[0] + 1)
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n[0] + 1)
for _ in 0..<n[1] {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[input[0]].append(input[1])
    arr[input[1]].append(input[0])
}
var queue = [Int]()
var index = 0
var ans = 0
for i in 1...n[0] {
    if vis[i] != 0  { continue }
    queue.append(i)
    ans += 1
    vis[i] = ans
    while queue.count > index {
        for j in arr[queue[index]] {
            if vis[j] != 0 { continue }
            queue.append(j)
            vis[j] = ans
        }
        index += 1
    }
}
print(ans)