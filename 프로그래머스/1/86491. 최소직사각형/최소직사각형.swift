import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    
    var width = [Int]()
    var length = [Int]()
    
    for i in sizes{
        if i[0] < i[1] {
        width.append(i[0])
        length.append(i[1])
        } else {
             width.append(i[1])
             length.append(i[0])
        }
    }
   
    return width.max()! * length.max()!
    
}