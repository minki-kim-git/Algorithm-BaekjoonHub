import Foundation


func solution(_ n:Int, _ words:[String]) -> [Int] {
    var ans = [0,0]
    var dic = [String:Bool]()
    var index = 1
    var count = 0
    dic[words[0]] = true
    for i in 0..<words.count - 1 {
      index += 1
        if words[i].last! == words[i+1].first! {
            if let val = dic[words[i+1]]{
                ans[0] = (i+2)%n == 0 ? (i+2)%n+n : (i+2)%n
                ans[1] = count+1
                break
            } else {
                dic[words[i+1]] = true
            }
        } else {
            ans[0] = (i+2)%n == 0 ? (i+2)%n+n : (i+2)%n
            ans[1] = count+1
                break
        }
        if index == n {
            count += 1
            index = 0
        }
    }
    return ans
}