import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var ans = 0
    for i in 1...number {
        var count = 0
        let sqrtValue = Int(Double(i).squareRoot())
        for j in 1...sqrtValue{
            if i % j == 0 {
                count += 1
                if j != i / j {
                    count += 1
                }
            }
             
        }
        ans += count > limit ? power : count
    }
    return ans 
}