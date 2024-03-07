let n = Int(readLine()!)!
var input = readLine()!.split(separator:" ").map { Int(String($0))! }
input.sort()
print(input[(n-1)/2])