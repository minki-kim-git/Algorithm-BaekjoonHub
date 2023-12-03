func solution(_ x:Int) -> Bool {
    var num = String(x).map{Int(String($0))!}
    return x % num.reduce(0){$0+$1} == 0 ? true : false
}