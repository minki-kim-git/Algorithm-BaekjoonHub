import Foundation

func solution(_ dartResult:String) -> Int {
    var num = [String]()
    var cal = [Int]()
    var index = 0
    var n = ""
    for i in dartResult.enumerated(){
        if let val = Int(String(i.element)){
            n += String(i.element)
            continue
        } else {
            if n != "" {
                num.append(n)
                n = ""
            }
        }
        switch i.element {
        case "S":
            cal.append(Int(num.last!)!)
            break
        case "D":
            cal.append(Int(pow(Double(num.last!)!, 2.0)))
            break
        case "T":
            cal.append(Int(pow(Double(num.last!)!, 3.0)))
        case "*":
            if cal.count >= 2 {
                cal[cal.count-1] = cal.last! * 2
                cal[cal.count-2] = cal[cal.count-2] * 2
            } else {
                cal[cal.count-1] = cal.last! * 2
            }
        case "#":
            cal[cal.count-1] = cal.last! * -1
        default: break
        }
    }
    return cal.reduce(0, +)
}