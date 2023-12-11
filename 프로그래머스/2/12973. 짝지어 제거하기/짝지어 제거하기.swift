import Foundation

func solution(_ s:String) -> Int{
    var arr = [Character]()
    for i in s{
        if arr.isEmpty{
            arr.append(i)
        } else {
            if i == arr.last!{
                arr.removeLast()
            } else {
                arr.append(i)
            }
        }
   

    }
    return arr.isEmpty ? 1 : 0
}