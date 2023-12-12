func solution(_ x:Int, _ n:Int) -> [Int] {
    var ans = [Int]()
    ans.append(x)
    for i in 1..<n{
        ans.append(ans.last! + x)
    }
    return ans
}