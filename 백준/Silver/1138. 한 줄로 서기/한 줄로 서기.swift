let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}

var ans = ""
var num = n
var arr = [Int]()

for i in input.reversed() {
    arr.insert(num, at: i)
    num -= 1
}

_ = arr.map {
    ans += "\($0) "
}

ans.removeLast()

print(ans)