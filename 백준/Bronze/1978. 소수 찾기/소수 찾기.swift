let n = Int(readLine()!)!
var count = n
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in input {
    if i == 1 {
        count -= 1
    } else {
        for j in 2..<i {
            if i % j == 0 {
                count -= 1
                break
            }
        }
    }
}
print(count)