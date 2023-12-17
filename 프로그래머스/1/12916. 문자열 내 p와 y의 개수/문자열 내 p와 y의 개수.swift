import Foundation

func solution(_ s:String) -> Bool
{
    var p = 0
    var y = 0
    for i in s{
        if i == "p" || i == "P" {
            p += 1
        }else if i == "y" || i == "Y"{
            y += 1
        }
    }

    return p == y ? true : false
}