import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var ans = Array(repeating: 0, count: id_list.count)
    var userDic = [String:Int]()
    var reportDic = [String:[String:Bool]]()
    for i in id_list{
        userDic[i] = 0
    }
    for i in report{
        let str = i.split(separator: " ").map{String($0)}
        if reportDic[str[1]] == nil {
            reportDic[str[1]] = [str[0]:true]
        } else {
            if reportDic[str[1]]![str[0]] == nil {
                reportDic[str[1]]![str[0]] = true
            }
        }
    }
    _ = reportDic.filter {  $0.value.count >= k
    }.map {
        $0.value.map {
            if let val = userDic[$0.key] {
                userDic[$0.key] = val + 1
            }
        }
    }
    for i in 0..<id_list.count{
        ans[i] = userDic[id_list[i]]!
    }
    return ans
}