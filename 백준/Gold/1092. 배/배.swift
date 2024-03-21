var ans = 0
let n = Int(readLine()!)!
var limit = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
let m = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted()
if arr.last! > limit.first! {
    print(-1)
} else {
    while arr.count > 0 {
        for i in limit {
            for j in stride(from: arr.count-1, through: 0, by: -1) {
                if arr[j] <= i {
                    arr.remove(at: j)
                    break
                }
            }
        }
        ans += 1
    }
    print(ans)
}