func discernStr(input: [String]) -> String {
    var dic = Array(repeating: [String:Bool](), count: input.count)
    for i in 0..<input.count {
        var index = 0
        for j in i+1..<input.count {
            let str = input[i] + input[j]
            if let val = dic[index][str] {
                return "\(input.joined()) is NOT surprising."
            } else {
                dic[index][str] = true
            }
            index += 1
        }
    }
    return "\(input.joined()) is surprising."
}

while let input = readLine(){
    guard input != "*" else { break }
    let input = input.map{String($0)}
    print(discernStr(input: input))
}