let input = readLine()!.map{String($0)}

var arr = [String]()

func solve(str:String) -> Bool {
    
    func changeStr(_ now:String, _ next:String) -> Bool {
        for i in 0..<arr.count {
            if arr[i] == now {
                arr[i] = next
                return true
            }
        }
        return false
    }
    
    switch str {
    case "q":
        if !changeStr("k", "q") { arr.append("q") }
    case "u":
        if !changeStr("q", "u") { return false }
    case "a":
        if !changeStr("u", "a") { return false }
    case "c":
        if !changeStr("a", "c") { return false }
    case "k":
        if !changeStr("c", "k") { return false }
    default: break
    }
    
    return true
}

for i in input {
    if !solve(str: i) {
        arr.removeAll()
        break
    }
}

if arr.isEmpty || arr.filter({ $0 != "k" }).count >= 1 {
    print(-1)
} else {
    print(arr.count)
}