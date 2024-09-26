let n = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map{Int(String($0))!}

var arr = Array(repeating: Array(repeating: 0, count: 0), count: n+1)
var ans = 0

for _ in 0..<n {
    let kt = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[kt[0]].append(kt[1])
}

for i in p.enumerated() {
    let sort = arr[i.offset+1].sorted()
    var temp = 0
    for j in 0..<i.element {
        ans += sort[j]
        if temp != 0 {
            ans += sort[j] - temp
        }
        temp = sort[j]
    }
    if i.offset == p.count - 1 { break }
    ans += 60
}

print(ans)