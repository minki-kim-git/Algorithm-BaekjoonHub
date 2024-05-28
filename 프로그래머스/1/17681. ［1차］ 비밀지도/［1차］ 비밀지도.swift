func convertBinary(_ arr:[Int],_ n:Int) -> [[String]] {
    var strArr = Array(repeating:Array(repeating:"",count:0),count:n)
    for i in 0..<arr.count {
        var num = arr[i]
        var str = ""
        while num > 0 {
            if num % 2 == 0 {
                str += "0"
                num /= 2
            } else {
                str += "1"
                num /= 2
            }
        }
        for _ in 0..<n-str.count {
            str += "0"
        }
        strArr[i].append(contentsOf:String(str.reversed()).map{String($0)})
    }
    return strArr
}


func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    let arr1 = convertBinary(arr1,n)
    let arr2 = convertBinary(arr2,n)
    for i in 0..<n {
        var str = ""
        for j in 0..<n {
            if arr1[i][j] == "1" || arr2[i][j] == "1" {
                str += "#"
            } else {
                str += " "
            }
        }
        answer.append(str)
    }
    return answer
}