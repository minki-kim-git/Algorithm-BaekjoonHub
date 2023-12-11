func solution(_ n:Int) -> Int {
    var a = 1
    var b = 0
    var index = 1
    var ans = 0
    while true {
       ans = (a + b) % 1234567
       b = a
       a = ans    
       index += 1
       if index == n {
           break
       }
   }
    return ans % 1234567
}