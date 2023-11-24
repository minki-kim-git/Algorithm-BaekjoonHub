let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var dic = [String: Bool]()
for _ in 0..<n[0]{
    let input = readLine()!
    dic[input] = false
}
for _ in 0..<n[1]{
    let input = readLine()!
    if let _ = dic[input]{
        dic[input] = true
    }
}

var arr = [String]()
var filter = dic.filter{ _, val in
    val == true
}
let _ = filter.map { key, _ in
    arr.append(key)
}
print(arr.count)
let answer = arr.sorted()
let _ = answer.map {
    print($0)
}
