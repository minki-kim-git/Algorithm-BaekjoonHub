import Foundation
let input = readLine()!
let n = Int(readLine()!)!
var ans = 0
func containsnum(_ str:String) -> Bool{
    if str.contains(input) {
        ans += 1
        return true
    } else {
        return false
    }
}
for _ in 0..<n{
    var ring = readLine()!
    for _ in 0..<10{
        let firststr = String(ring.first!)
        ring.removeFirst()
        ring += firststr
        if containsnum(ring) {
            break
        }
    }
}
print(ans)
