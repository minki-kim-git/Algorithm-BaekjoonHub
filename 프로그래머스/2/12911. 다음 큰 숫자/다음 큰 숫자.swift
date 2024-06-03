import Foundation

func solution(_ n:Int) -> Int {
    var answer:Int = 0
    var count = 0
    var i = 0
    var num = n
    while num > 0{
        if num % 2 == 1{
            count += 1
        }
        num /= 2
    }
    num = n
    while true {
        i+=1
        num += i
        var numCount = 0
        while num > 0{
            if num % 2 == 1{
                numCount += 1
            }
            num /= 2
        }
        if numCount == count {
            answer = n + i
            break
        }
         num = n 
    }
    return answer
}
