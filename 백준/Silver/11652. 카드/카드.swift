let n = Int(readLine()!)!
var dic = [Int:Int]()
var maxCount = 1
for _ in 0..<n{
    let input = Int(readLine()!)!
    if let val = dic[input]{
        dic[input] = val + 1
        maxCount = max(maxCount,val+1)
    } else {
        dic[input] = 1
    }
}
print(dic.filter { $0.value == maxCount }.sorted { $0.key < $1.key }.first!.key)