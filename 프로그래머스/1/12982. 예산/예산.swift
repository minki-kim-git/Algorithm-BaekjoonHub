import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var arr = d.sorted()
    var count = 0
    var ans = 0
    arr.map{
        if count <= budget{
        count += $0
        ans += 1
        }
    }
    return count <= budget ? ans : ans - 1
}