import Foundation
func solution(_ babbling:[String]) -> Int {
    var ans = 0
    let arr = ["aya","ye","woo","ma"]
    
    for i in babbling{
        var str = i
        var temp = ""
        while 0 < str.count {
            if arr.contains(String(str.prefix(2))) {
                if temp == String(str.prefix(2)){
                    break
                }
                temp = String(str.prefix(2))
                str.removeFirst(2)
            } else if arr.contains(String(str.prefix(3))) {
                if temp == String(str.prefix(3)){
                    break
                }
                temp = String(str.prefix(3))
                str.removeFirst(3)  
            } else {
                break
            }
        }
        if str.isEmpty {
            ans += 1
        }
    }
    return ans
}
