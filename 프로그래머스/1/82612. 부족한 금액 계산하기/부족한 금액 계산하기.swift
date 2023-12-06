import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int{
    var num = 0
    for i in 1...count {
       num += i * price
    }
    return num <= money ? 0 : num - money
}