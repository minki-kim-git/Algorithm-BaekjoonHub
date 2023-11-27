func solution(_ s:String) -> String {
    var arr = s.components(separatedBy: " ").map{String($0)}
    var ans = ""
    for i in 0..<arr.count {
        var str = arr[i].map{String($0)}
        var s = ""
        var index = 1
        for j in str {
            index += 1
            if index % 2 == 0{
                 s += j.uppercased()
            } else {
                s += j.lowercased()
            }
        }
        if i == arr.count - 1 {
              ans += s
        } else {
             ans += s + " "
        }
    }
    return ans
}