let n = Int(readLine()!)!
var dic = [Int:[Int:Int]]()
var countDic = [Int:Int]()
var count = 0
for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    dic[input[2]] = [input[0]:input[1]]
}
for i in dic.sorted(by: { $0.key > $1.key }) {
    if let val = countDic[i.value.first!.key] {
        guard val != 2 else { continue }
        countDic[i.value.first!.key] = val + 1
    } else {
        countDic[i.value.first!.key] = 1
    }
    print(i.value.first!.key,i.value.first!.value)
    count += 1
    guard count != 3 else { break }
}