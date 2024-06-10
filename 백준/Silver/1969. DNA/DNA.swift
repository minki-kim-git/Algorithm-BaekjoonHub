let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var dicArr = Array(repeating: [Character:Int](), count: n[1])
var ans = ""
var minCount = 0
for _ in 0..<n[0] {
    let input = readLine()!
    for i in input.enumerated() {
        if let val = dicArr[i.offset][i.element] {
            dicArr[i.offset][i.element] = 1 + val
        } else {
            dicArr[i.offset][i.element] = 1
        }
    }
}
for i in dicArr {
    let sort = i.sorted {
        $0.value > $1.value
    }
    let max = sort.first!.value
    var str = [Character]()
    for j in sort{
        if max == j.value {
            str.append(j.key)
        }
    }
    minCount += n[0] - sort.first!.value
    ans += String(str.sorted().first!)
}
print(ans)
print(minCount)