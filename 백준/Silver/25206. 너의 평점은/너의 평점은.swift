var ans = 0.0
var sum = 0.0
for _ in 0..<20{
    let input = readLine()!.split(separator: " ")
    if input[2] != "P"{
        sum += Double(input[1])!
    }
    switch input[2]{
    case "A+":
        ans += Double(input[1])! * 4.5
    case "A0":
        ans += Double(input[1])! * 4.0
    case "B+":
        ans += Double(input[1])! * 3.5
    case "B0":
        ans += Double(input[1])! * 3.0
    case "C+":
        ans += Double(input[1])! * 2.5
    case "C0":
        ans += Double(input[1])! * 2.0
    case "D+":
        ans += Double(input[1])! * 1.5
    case "D0":
        ans += Double(input[1])! * 1.0
    case "F":
        ans += Double(input[1])! * 0.0
    default:
      break
    }
}
print(ans/sum)