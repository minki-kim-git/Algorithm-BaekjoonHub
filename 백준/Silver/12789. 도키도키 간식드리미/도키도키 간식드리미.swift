let num = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int($0)!}
var arr = [Int]()
var n = 1
for i in 0..<num {
    if input[i] == n{
        n += 1
    } else {
        arr.append(input[i])
    }
    while true {
        if arr.last == n {
            n += 1
            arr.removeLast()
        } else {
            break
        }
    }
}
if num + 1 == n {
    print("Nice")
} else {
    print("Sad")
}