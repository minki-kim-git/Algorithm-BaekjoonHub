let input = readLine()!.map{String($0)}

func minNum() -> Int {
    var index = 0
    var num = 1
    
    while true {
        let str = String(num)
        for i in str {
            if String(i) == input[index] {
                index += 1
                if index == input.count { return num }
            }
        }
        num += 1
    }
    
}

print(minNum())