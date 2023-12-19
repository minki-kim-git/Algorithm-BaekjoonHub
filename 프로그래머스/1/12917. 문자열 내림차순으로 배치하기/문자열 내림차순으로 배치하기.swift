func solution(_ s:String) -> String {
    return s.sorted(by:>).reduce(""){String($0) + String($1)}
}