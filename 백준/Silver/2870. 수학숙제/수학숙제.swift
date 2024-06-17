let n = Int(readLine()!)!
var arr = [String]()
var ans = Array(repeating: Array(repeating: "", count: 0), count: 101)
var str = ""
for _ in 0..<n{
    let input = readLine()!.map{String($0)}
    for i in input{
        if let _ = Int(i){
            str += i
        } else {
            if str != "" {
                if str.count >= 2 {
                    while str.first! == "0" {
                        str.removeFirst()
                        if str.count == 1 { break }
                    }
                }
                ans[str.count].append(str)
                arr.append(str)
            }
            str = ""
        }
    }
    if str != "" {
        if str.count >= 2 {
            while str.first! == "0" {
                str.removeFirst()
                if str.count == 1 { break }
            }
        }
        ans[str.count].append(str)
        arr.append(str)
        str = ""
    }
}
_ = ans.map {
    $0.sorted().map {
        print($0)
    }
}