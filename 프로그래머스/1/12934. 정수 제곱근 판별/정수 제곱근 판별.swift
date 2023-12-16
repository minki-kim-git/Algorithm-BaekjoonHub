func solution(_ n:Int64) -> Int64 {
    var i = 1
    while true {
        if i * i == n{
            i += 1
            return Int64(i * i)
        } else if i * i > n{
            return Int64(-1)
        }
        i += 1
    }
}