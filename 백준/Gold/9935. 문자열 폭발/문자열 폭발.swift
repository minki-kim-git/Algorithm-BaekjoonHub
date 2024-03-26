let input = readLine()!
let n = readLine()!
var str = ""
for i in input {
    str += String(i)
    if str.suffix(n.count) == n{
        str.removeLast(n.count)
    }
}
if str.isEmpty {
    print("FRULA")
} else {
    _ = str.map{
        print($0,terminator: "")
    }
}