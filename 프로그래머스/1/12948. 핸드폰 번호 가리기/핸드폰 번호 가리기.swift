func solution(_ phone_number:String) -> String {
    let num = phone_number.map{String($0)}
    var result = ""
    for i in 0..<num.count{
        if num.count - i <= 4{
            result += num[i]
        }
        else {
            result += "*"
        }
    }
    return result
}