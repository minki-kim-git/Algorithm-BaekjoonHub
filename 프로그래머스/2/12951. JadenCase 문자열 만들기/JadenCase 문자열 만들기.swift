func solution(_ s:String) -> String {
    let arr = s.components(separatedBy: " ")
    var ans = ""
    for i in 0..<arr.count{
        let word = arr[i].map{ String($0) }
        var str = ""
        for j in 0..<word.count{
            if j == 0 {
                if let num = Int(word[j])  {
                    str += word[j]
                } else {
                    str += word[j].uppercased()
                }
            }
            else {
                str += word[j].lowercased()
            }
        }
        if i == arr.count - 1 {
            ans += str
        } else {
            ans += str + " "
        }
    }
    return ans
}
