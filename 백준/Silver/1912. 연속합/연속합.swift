var testCase = Int(readLine()!)!
var input = readLine()!.split(separator:" ").map{Int(String($0))!}
var realMax = input[0]
var d = Array(repeating: 0, count: testCase)
d[0] = input[0]
for i in 1..<testCase{
    let temp =  d[i-1] + input[i]
    var max = input[i]
    if temp > max {
        max = temp
        }
    d[i] = max
    if max > realMax{
        realMax = max
    }
}
print(realMax)