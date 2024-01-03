import Foundation

func solution(_ n:Int) -> Int {
    var num = n
    var numstr = ""
    while num > 0 {
        if num % 3 == 0 {
            num /= 3
            numstr += "0"
        }else {
            numstr += "\(num % 3)"
            num /= 3
        }
    }
    var index = 0
    var ans = 0
    for j in String(Int(numstr)!).map({String($0)}).reversed(){
        ans += Int(j)! * Int(pow(3, Double(index)))
        index += 1
    }
    return ans
}