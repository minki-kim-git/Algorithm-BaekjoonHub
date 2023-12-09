import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var ans = 0
    var index = 0
    var arr = number
    for i in 0..<discount.count {
        index += 1
        if index == 11 {
            index -= 1
            if let val = want.firstIndex(of:discount[i-10]) {
                arr[val] += 1  
            }
        }
        if let val = want.firstIndex(of:discount[i]) {
           arr[val] -= 1 
            if arr.filter{$0 > 0}.isEmpty{
                ans += 1
            }
       }
    }
    return ans
}