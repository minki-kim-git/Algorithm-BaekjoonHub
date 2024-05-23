import Foundation

func solution(_ citations:[Int]) -> Int {
    let arr = citations.sorted(by: >)
    var ans = 0
    for i in 1...citations.count {
        if arr[i-1] >= i {
            ans = i
        } else {
            break
        }
    }
    return ans
}