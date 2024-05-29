import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var dic = [Character:Int]()
    var ans = [Int]()
    for i in keymap {
        for j in i.enumerated(){
            if let val = dic[j.element] {
                dic[j.element] = min(val,j.offset+1)
            } else {
                dic[j.element] = j.offset+1
            }
        }
    }
    for i in targets {
        var num = 0
        for j in i {
            if let val = dic[j] {
                num += val
            } else {
                num = -1
                break
            }
        }
        ans.append(num)
    }
    return ans
}