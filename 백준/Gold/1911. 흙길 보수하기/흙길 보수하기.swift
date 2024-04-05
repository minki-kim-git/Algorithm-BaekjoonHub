var dic = [Int:Int]()
var ans = 0
var length = -1
let n = readLine()!.split(separator: " ").map { Int(String($0))!}
for _ in 0..<n[0]{
    let input = readLine()!.split(separator: " ").map { Int(String($0))!}
    dic[input[0]] = input[1]
}
for i in dic.sorted(by: <) {
    var count = 0
    if i.key <= length {
        guard i.value > length else { continue }
        if (i.value - (length - i.key + 1 + i.key)) % n[1] == 0 {
            count = (i.value - (length - i.key + 1 + i.key)) / n[1]
        } else {
            count = (i.value - (length - i.key + 1 + i.key)) / n[1] + 1
        }
        ans += count
        length = count * n[1] + length - i.key + i.key
    } else {
        if (i.value - i.key) % n[1] == 0 {
            count = (i.value - i.key) / n[1]
        } else {
            count = ((i.value - i.key) / n[1]) + 1
        }
        ans += count
        length = count * n[1] + i.key - 1
    }
}
print(ans)