var n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
input.sort(by: >)
var maxNum = 0
var day = 0
for i in input {
    maxNum = max(i,maxNum - 1)
    day += 1
}
print(maxNum+day+1)