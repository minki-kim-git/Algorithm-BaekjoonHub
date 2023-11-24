let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var dic = [String:Int]()
for _ in 0..<n[0]{
    let input = readLine()!
    dic[input] = 0
}
for _ in 0..<n[1]{
    let input = readLine()!
    if let value = dic[input]{
        dic[input] = value + 1
    }
}
var ans = 0
let _ = dic.map { _, num in
    ans += num
}
print(ans)