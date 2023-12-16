import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var colanum = n
    var count = 0
    while colanum >= a {
        if colanum % a == 0 {
            count += ((colanum / a) * b)
            colanum = (colanum / a) * b        
        } else {
            count += ((colanum / a) * b)
            colanum = (((colanum / a) * b) + (colanum % a))
        }  
    }
    return count
}