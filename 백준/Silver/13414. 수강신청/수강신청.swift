let n = readLine()!.split(separator: " ").map { Int(String($0))! }
var dic = [String:Int]()
for i in 0..<n[1]{
    let input = readLine()!
    dic[input] = i
}
let sortedDic = dic.sorted { $0.value < $1.value }
let count = sortedDic.count
for i in 0..<n[0]{
    if i < count {
        print(sortedDic[i].key)
    } else {
        break
    }
}