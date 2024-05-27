import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var dic = [Character:Int]()
    for i in skill.enumerated() {
        dic[i.element] = i.offset
    }
    var ans = skill_trees.count
    for i in skill_trees {
        var index = 0
        for j in i {
            if let val = dic[j] {
                if val != index {
                    ans -= 1
                    break
                }
                index += 1
            }
        }
    }
    return ans
}