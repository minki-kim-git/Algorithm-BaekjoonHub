import Foundation

func solution(_ sizes:[[Int]]) -> Int {

    var ga = [Int]()
    var se = [Int]()
    for i in sizes{
        if i[0] < i[1] {
        ga.append(i[0])
        se.append(i[1])
        } else {
             ga.append(i[1])
             se.append(i[0])
        }
    }
   
        
    return ga.max()! * se.max()!
    
}