let n = Int(readLine()!)!
var arr = [0]
var ans = Set<Int>()
var stack = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
for i in 1...n {
    var narr = [Int]()
    var vis = Array(repeating: 0, count: n+1)
    stack.append(i)
    while !stack.isEmpty {
        let top = stack.popLast()!
        if vis[top] != 0 { break }
        narr.append(top)
        vis[top] = arr[top]
        stack.append(arr[top])
    }
    if narr.sorted() == vis.filter({ $0 != 0 }).sorted() {
        _ = narr.map {
            ans.insert($0)
        }
    }
}

print(ans.count)
_ = ans.sorted().map{print($0)}