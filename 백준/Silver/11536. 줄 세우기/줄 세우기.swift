let n = Int(readLine()!)!
var arr = [String]()
for _ in 0..<n{
    let input = readLine()!
    arr.append(input)
}
print(arr == arr.sorted(by: <) ? "INCREASING" : arr == arr.sorted(by: >) ? "DECREASING"  : "NEITHER")