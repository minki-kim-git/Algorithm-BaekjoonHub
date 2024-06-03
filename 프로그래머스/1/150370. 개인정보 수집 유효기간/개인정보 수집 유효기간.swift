import Foundation

func compareDate(m: Int, today: String, date:String ) -> Bool {
    var date = date.split(separator: ".").map{Int(String($0))!}
    let today = today.split(separator: ".").map{Int(String($0))!}
    if m + date[1] > 12 {
        var year = (m + date[1]) / 12
        var month = 0
        if (m + date[1]) % 12 == 0 {
            month = 12
            year -= 1
        } else {
            month =  (m + date[1]) % 12
        }
        date[0] =  date[0] + year
        date[1] =  month
    } else {
        date[1] = date[1] + m
    }
    if date[0] > today[0] {
        return true
    } else if date[0] < today[0] {
        return false
    }
    if date[1] > today[1] {
        return true
    } else if date[1] < today[1] {
        return false
    }
    if date[2] > today[2] {
        return true
    }
    return false
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var dic = [String:Int]()
    var ans = [Int]()
    let trems = terms.map { $0.split(separator: " ") }
    for i in trems {
        dic[String(i[0])] = Int(String(i[1]))!
    }
    for i in privacies.enumerated() {
        let date = i.element.split(separator: " ").map{String($0)}
        if !compareDate(m: dic[date[1]]!, today: today, date: date[0]) {
            ans.append(i.offset+1)
        }
    }
    return ans
}