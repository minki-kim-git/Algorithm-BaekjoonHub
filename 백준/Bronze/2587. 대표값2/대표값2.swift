var arr = [Int]()
var ans = 0
for _ in 0...4{
    let input = Int(readLine()!)!
    ans += input
    arr.append(input)
}
print(ans/5)
print(arr.sorted()[arr.count/2])