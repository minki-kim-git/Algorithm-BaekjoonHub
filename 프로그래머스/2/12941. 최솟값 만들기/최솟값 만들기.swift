import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    let a = A.sorted()
    let b = B.sorted()
    var ans = 0
    for i in 0..<a.count{
        ans += a[i] * b[b.count - (i + 1)]
    }
    return ans
}