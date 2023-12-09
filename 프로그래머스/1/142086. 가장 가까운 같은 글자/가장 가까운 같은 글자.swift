import Foundation

func solution(_ s:String) -> [Int] {
    var dic = [String:Int]()
    var s = s.map{String($0)}
    var ans = [Int]()
    for i in 0..<s.count {
        if let value = dic[s[i]] {
             dic[s[i]] = i 
            ans.append(i - value)
           
        } else {
            dic[s[i]] = i
            ans.append(-1)
        }
    }
    return ans
}