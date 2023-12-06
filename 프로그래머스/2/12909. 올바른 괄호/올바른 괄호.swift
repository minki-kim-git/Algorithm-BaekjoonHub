import Foundation

func solution(_ s:String) -> Bool
{
    var count = 0
    var s = s.map{String($0)}
    for i in s {
        if i == "("{
            count += 1
        } else {
            if count == 0{
                return false
            } else {
                count -= 1
            }
        }
    }
    return count == 0 ? true : false
}
