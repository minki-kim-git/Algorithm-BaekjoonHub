var ans = ""
var num = 0
var arr = Array(repeating: Array(repeating: "", count: 0), count: 1001)
var sequenceDic = [String:Int]()
var countDic = [String:Int]()
let n = readLine()!
let _ = readLine()!.split(separator: " ").map {
    if sequenceDic[String($0)] == nil{
        sequenceDic[String($0)] = num
    }
    if let val = countDic[String($0)] {
        countDic[String($0)] = 1 + val
    } else {
        countDic[String($0)] = 1
    }
    num += 1
}
_ = countDic.map{ arr[$0.value].append($0.key) }
for i in stride(from: 1000, to: 0, by: -1) {
    if !arr[i].isEmpty{
        var filterarr = [Int]()
        for j in arr[i] {
            if let val = sequenceDic[String(j)] {
                filterarr.append(val)
            }
        }
        for k in filterarr.sorted() {
            let num = sequenceDic.filter {
                $0.value == k
            }.first!.key
            for _ in 0..<i{
                ans += "\(num) "
            }
        }
    }
}
ans.removeLast()
print(ans)