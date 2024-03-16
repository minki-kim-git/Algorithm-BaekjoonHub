var input = readLine()!
var count = 0
while input.count > 1 {
    var num = 0
    for i in input {
        num += Int(String(i))!
    }
    input = String(num)
    count += 1
}
print(count)
Int(input)! % 3 != 0 ? print("NO") : print("YES")