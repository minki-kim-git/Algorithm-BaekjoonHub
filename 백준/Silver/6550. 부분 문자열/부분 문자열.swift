while let input = readLine()?.split(separator: " "){
    var s = input[0].map{String($0)}
    var t = input[1].map{String($0)}
    var index = 0
    for i in t {
        if i == s[index] {
            index += 1
            if index == s.count {
                print("Yes")
                break
            }
        }
    }
    if index != s.count {
        print("No")
    }
}