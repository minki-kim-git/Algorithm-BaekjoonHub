var i = 1
var num = 1

var input = Int(readLine()!)!
while true {
    num = i * 6 + num
    if num >= input{
        break
    }
    i += 1
}
if input == 1 {
    print(1)
} else { print(i + 1)
}