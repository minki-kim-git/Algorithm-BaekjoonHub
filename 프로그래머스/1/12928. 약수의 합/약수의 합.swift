func solution(_ n:Int) -> Int {
    var ans = 0
    if n > 1{
    for i in 1...n/2{
        if n % i == 0 {
            ans += i
        }
    }
}
    return ans + n
}