var dic = [Int:Int]()
var ans = [Int:Int]()
for i in 1...8{
    let input = Int(readLine()!)!
    dic[input] = i
}
for i in dic.sorted(by: >) {
    if ans.count == 5{
        break
    }
    ans[i.key] = i.value
}
print(ans.keys.reduce(0,{ $0 + $1 }))
for i in ans.sorted(by: { $0.value < $1.value }).enumerated() {
    if i.offset == 4 {
        print(i.element.value)
    } else {
        print(i.element.value,terminator: " ")
    }
}