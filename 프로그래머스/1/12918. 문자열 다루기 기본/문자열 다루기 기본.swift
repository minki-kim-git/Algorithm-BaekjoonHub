func solution(_ s:String) -> Bool {
    guard Int(s) != nil && (s.map{$0}.count == 4 || s.map{$0}.count == 6) else {return false}
    return true
}