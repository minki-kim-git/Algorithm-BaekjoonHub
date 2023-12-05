import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var arr = score.sorted()
    arr = arr.reversed()
    var ans = 0
    for i in stride(from:0,through:score.count-1,by:m){
        if i + m <= score.count {
        ans += arr[i+m-1] * m
        }
    } 
    return ans
}