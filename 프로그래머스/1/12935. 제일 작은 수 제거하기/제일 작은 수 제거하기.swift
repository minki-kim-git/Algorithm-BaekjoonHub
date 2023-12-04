func solution(_ arr:[Int]) -> [Int] {
    if arr.count == 1 {
        return [-1]
    }
    var ans = arr
    ans.remove(at:arr.firstIndex(of:arr.min()!)!)
    return ans
}