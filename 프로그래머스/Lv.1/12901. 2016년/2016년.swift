func solution(_ a:Int, _ b:Int) -> String {
    let date = ["MON","TUE","WED","THU","FRI","SAT","SUN"]
    let monthcount = [31,29,31,30,31,30,31,31,30,31,30,31]
    var month = 0
    var day = 1
    var index = 4
    var ans = ""
    while month != a {
        for _ in 1...monthcount[month] {
            ans = date[index]
            index += 1
            if index == 7 {
                index = 0
            }
            if month == a-1 && day == b{
                break
            }
            day += 1
            
        }
        day = 1
        month += 1
    }
    return ans
}