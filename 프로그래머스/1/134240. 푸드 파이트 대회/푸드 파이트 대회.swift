import Foundation

func solution(_ food:[Int]) -> String {
    var arr = [Int]()
    var ans = ""
    for i in 1..<food.count{
        for j in 0..<food[i] / 2{
                arr.append(i)
            ans += "\(i)"
            }
    }
    ans += "0"
    for i in 0..<arr.count{
       ans += "\(arr[arr.count - 1 - i])"
    }
    return ans
}