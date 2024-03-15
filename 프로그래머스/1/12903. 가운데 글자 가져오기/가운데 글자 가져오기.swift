func solution(_ s:String) -> String {
    var s = s.map{String($0)}
    var ans = s.count / 2
    if s.count % 2 == 0{
        var a = s[ans-1]+s[ans]
        return a
    } else {
        return s[ans]
    }
}