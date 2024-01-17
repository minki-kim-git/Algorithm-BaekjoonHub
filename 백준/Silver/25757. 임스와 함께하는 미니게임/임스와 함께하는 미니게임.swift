let n = readLine()!.split(separator: " ")
var set = Set<String>()
for _ in 0..<Int(n[0])!{
    let input = readLine()!
    set.insert(input)
}
switch n[1]{
case "Y":
    print(set.count)
case "F":
    print(set.count / 2)
case "O":
    print(set.count / 3)
default: break
}