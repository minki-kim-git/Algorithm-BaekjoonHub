import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic = [String:[String]]()
    var ans = 1
    for i in clothes{
        if dic.keys.contains(i[1]) {
              dic[i[1]]!.append(i[0])
        } else {
            dic[i[1]] = [i[0]]
        }
    }
    for i in dic{
        ans *= (i.value.count + 1)
    }
    return ans - 1
}