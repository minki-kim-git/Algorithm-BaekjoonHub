var set = Set<Int>()
var ans = ""
let _ = readLine()!
let _ = readLine()!.split(separator: " ").map {
    set.insert(Int(String($0))!)
}
_ = set.sorted().map {
    ans += "\($0) "
}
ans.removeLast()
print(ans)