var dic = [Int:Bool]()
let n = readLine()!.split(separator: " ").map { Int(String($0))! }
let _ = readLine()!.split(separator: " ").map {
    dic[Int(String($0))!] = true
}

let _ = readLine()!.split(separator: " ").map {
    if dic[Int(String($0))!] != nil {
        dic[Int(String($0))!] = false
    }
}
let ans = dic.filter { $0.value == true }.sorted { $0.key < $1.key }

if ans.isEmpty {
    print(0)
} else {
    print(ans.count)
    for i in 0..<ans.count {
        if i < ans.count-1{
            print(ans[i].key,terminator: " ")
        } else {
            print(ans[i].key,terminator: "")
        }
    }
}
