var input = readLine()!.split(separator:" ").map{Int(String($0))!}
var arr = Array(repeating:0,count:9)
var boolArr = Array(repeating:false,count:9)
func backTracking(index: Int, n: Int, m: Int) {
    if m == index{
        for j in 0..<m{
            print(arr[j],terminator:" ")
        }
        print()
        return
    }
    for i in 1...n{
        if boolArr[i] == true {
            continue
        }
        boolArr[i] = true
        arr[index] = i
        backTracking(index: index+1, n: n, m: m)
        boolArr[i] = false
    }
}
backTracking(index: 0, n: input[0], m: input[1])