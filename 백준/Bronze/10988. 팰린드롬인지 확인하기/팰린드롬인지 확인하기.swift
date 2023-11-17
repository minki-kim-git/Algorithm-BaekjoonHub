let input = readLine()!.map{String($0)}
var ans = 1
for i in 0..<(input.count/2){
    if input[i] == input[input.count-1-i]{
        ans = 1
    } else {
        ans = 0
        break
    }
}
print(ans)
