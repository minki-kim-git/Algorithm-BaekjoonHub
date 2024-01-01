import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var arr = [Int]()
    var ans = [Int]()
    for i in score {
        arr.append(i)
        arr = arr.sorted(by:>)
        if arr.count > k {
            arr.removeLast()
            ans.append(arr.last!)
        } else {
            ans.append(arr.last!)
        }
    }
    return ans
}