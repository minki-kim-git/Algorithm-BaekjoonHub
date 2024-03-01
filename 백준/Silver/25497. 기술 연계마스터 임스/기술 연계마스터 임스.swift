let _ = readLine()!
let input = readLine()!.map{String($0)}
var ans = 0
var larr = [String]()
var sarr = [String]()
for i in input {
    if i == "L" {
        larr.append("l")
    } else if i == "R" {
        if larr.isEmpty{
            break
        }
        larr.removeLast()
        ans += 1
    } else if i == "S" {
        sarr.append("s")
    } else if i == "K" {
        if sarr.isEmpty{
            break
        }
        sarr.removeLast()
        ans += 1
    } else {
        ans += 1
    }
}
print(ans)