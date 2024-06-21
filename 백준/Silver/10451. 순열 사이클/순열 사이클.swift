let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var arr = Array(repeating: 0, count: n+1)
    var vis = Array(repeating: 0, count: n+1)
    
    var stack = [Int]()
    var ans = 0
    
    for i in input.enumerated() {
        arr[i.offset+1] = i.element
    }
    
    for i in 1...n {
        if vis[i] != 0 { continue }
        stack.append(arr[i])
        vis[i] = 1
        ans += 1
        while !stack.isEmpty {
            let top = stack.popLast()!
            if vis[top] != 0 { continue }
            vis[top] = 1
            stack.append(arr[top])
        }
    }
    print(ans)
}