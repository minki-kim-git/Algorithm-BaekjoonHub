import Foundation

func solution(_ new_id:String) -> String {
    var ans = ""
    var str = ""
    for i in new_id.lowercased() {
        let asciiValue = i.unicodeScalars.first!.value
        if  asciiValue >= 48 && asciiValue <= 57 || asciiValue >= 97 && asciiValue <= 122 || i == "." || i == "_" || i == "-"  {
            ans += String(i)
                }
    }
    for i in ans {
        if str.last ?? " " == "." && i == "." {
            str.removeLast()
        }
        str += String(i)
    }
    if !str.isEmpty {
        if str.first! == "." {
            str.removeFirst()
        }
        if str.last ?? " " == "." {
            str.removeLast()
        }
    }
    ans = ""
    if str.isEmpty {
        ans += "a"
    } else if str.count > 15 {
        var index = 0
        for i in str{
             ans += String(i)
            index += 1
            if index == 15 { break }
        }
        if ans.last! == "." {
            ans.removeLast()
        }
    } else {
        ans = str
    }
    while ans.count < 3 {
        ans += String(ans.last!)
    }
    return ans
}