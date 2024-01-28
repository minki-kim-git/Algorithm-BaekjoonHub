let n = Int(readLine()!)!
let std = readLine()!.split(separator: " ")

var dic = [String:Int]()
_ = std.map {
    dic[String($0)] = 0
}
for _ in 0..<n{
    let input = readLine()!.split(separator: " ")
    for i in input {
        if let val = dic[String(i)] {
            dic[String(i)] = val + 1
        }
    }
}
var arr = Array(repeating: Array(repeating: "", count: 0), count: dic.values.max()!+1)
for i in dic {
    arr[i.value].append(i.key)
}
for i in stride(from: arr.count-1, through: 0, by: -1){
    if arr[i].count > 1 {
        arr[i].sort()
        for j in arr[i]{
            print(j, i)
        }
    }else if arr[i].count == 1{
        print(arr[i][0], i)
    }
}