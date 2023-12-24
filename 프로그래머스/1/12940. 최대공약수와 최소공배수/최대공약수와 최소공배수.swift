func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n,m),lcm(n,m)]
}
func gcd(_ a: Int, _ b: Int) -> Int {
    var num1 = a
    var num2 = b
    while num2 != 0 {
        let remainder = num1 % num2
        num1 = num2
        num2 = remainder
    }
    return abs(num1)
}
func lcm(_ a: Int, _ b: Int) -> Int {
    return abs(a * b) / gcd(a, b)
}
