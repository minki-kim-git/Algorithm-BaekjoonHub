let n = Int(readLine()!)!
var set = Set<String>()
var dic = [String:Int]()
for _ in 0..<n {
    let input = readLine()!.split(separator: ".").map{String($0)}
    set.insert(input[1])
    if let val = dic[input[1]] {
        dic[input[1]] = val + 1
    } else {
        dic[input[1]] = 1
    }
}
for i in set.sorted() {
    print(i,dic[i]!)
}