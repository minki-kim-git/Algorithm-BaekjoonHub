import Foundation

func solution(_ n:Int) -> Int {
    var ans = 0
    var num = n
    while num > 0 {
        if num % 2 == 0 {
            num /= 2
        } else {
            num -= 1
            ans += 1
        }
    }
    return ans
}