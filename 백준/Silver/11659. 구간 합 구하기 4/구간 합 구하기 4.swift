let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var perarr = Array(repeating: 0, count: arr.count+1)
var num = 0
for i in 0..<arr.count{
    num += arr[i]
    perarr[i+1] = num
}
for _ in 0..<n[1]{
    let input = readLine()!.split(separator:" ").map{Int(String($0))!}
    print( perarr[input[1]] - perarr[input[0]-1])
    
}