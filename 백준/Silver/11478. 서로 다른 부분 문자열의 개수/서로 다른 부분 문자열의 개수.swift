let input = readLine()!.map{String($0)}
var set = Set<String>()
for i in 0..<input.count {
    var str = ""
    for j in i..<input.count{
        str += input[j]
        set.insert(str)
    }
}
print(set.count)