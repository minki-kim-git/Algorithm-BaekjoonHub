import Foundation

func solution(_ s:String) -> Int {
    var str = s
    var ans = 0
    while str.count > 0 {
        var fisrtStr = str.first!
        var count = 0
        var temp = str
        for i in temp {
            if fisrtStr == i {
                count += 1
            } else if count > 0{
                count -= 1
                if count == 0 {
                    str.removeFirst()
                    ans += 1
                    break
                }
            } 
            str.removeFirst()
        }
        ans = count != 0 ? ans + 1 : ans
    }
    return ans
}