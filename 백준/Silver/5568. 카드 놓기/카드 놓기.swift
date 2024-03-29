func permutation(_ target: [String], _ targetNum: Int) -> [[String]] {
    var result: [[String]] = []
    var check = [Bool](repeating: false, count: target.count)
    func permute(_ arr: [String]) {
        if arr.count == targetNum {
            result.append(arr)
            return
        }
        for i in 0..<target.count {
            if check[i] == true {
                continue
            } else {
                check[i] = true
                permute(arr + [target[i]])
                check[i] = false
            }
        }
    }
    permute([])
    return result
}

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var arr = [String]()
var dic = [String:Bool]()
for _ in 0..<n{
    let input = readLine()!
    arr.append(input)
}
for i in permutation(arr,k) {
    dic[i.reduce("", { $0 + $1 })] = true
}
print(dic.count)