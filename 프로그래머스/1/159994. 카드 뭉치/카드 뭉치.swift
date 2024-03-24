import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var card1 = Array(cards1.reversed())
    var card2 = Array(cards2.reversed())
    for i in goal {
        if card1.last == i {
            card1.removeLast()
        }
        else if card2.last == i{
            card2.removeLast()
        }
        else{
            return "No"
        }
    }
    return "Yes"
}
