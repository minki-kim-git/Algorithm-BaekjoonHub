import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var ans = 0
   var temp = 0
    for i in section{
        if temp == 0{
            temp = i + m - 1
            ans += 1
        }
        if temp < i {
            temp = i + m - 1
            ans += 1
        }
    }
    return ans 
}