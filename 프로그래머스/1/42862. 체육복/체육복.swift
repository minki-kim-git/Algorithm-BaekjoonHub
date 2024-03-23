import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lost = lost.sorted()
    var reserve = reserve.sorted()
    var losCount = lost.count
    if lost[0] == 0 { return n}
    for i in 0..<lost.count{
        for j in 0..<reserve.count{
            if lost[i] == reserve[j]{
                lost[i] = -5
                reserve[j] = -10
                losCount -= 1
            }
        }
    }
    for i in lost{
        for j in 0..<reserve.count{
            if i - 1 == reserve[j]{
                losCount -= 1
                reserve[j] = 100
                break
            }else if i + 1 == reserve[j]{
                losCount -= 1
                reserve[j] = 100
                break
            }
        }
    }
    return n - losCount
}