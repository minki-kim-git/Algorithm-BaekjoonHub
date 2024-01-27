let n = Int(readLine()!)!
var firststr = ""
var laststr = ""
var index = 0
var arr = [String]()
for i in 0..<n{
    let input = readLine()!
    arr.append(input)
    if input == "?"{ 
        index = i
    }
}
if index > 0 {
    laststr = String(arr[index-1].last!)
}
if index < arr.count - 1 {
    firststr = String(arr[index+1].first!)
}

let a = Int(readLine()!)!
for _ in 0..<a{
    let input = readLine()!
    if n == 1 {
        print(input)
        break
    }
    if index == arr.count-1 {
        if String(input.first!) == laststr && !arr.contains(input){
            print(input)
        }
    } else if index == 0 {
        if String(input.last!) == firststr && !arr.contains(input){
            print(input)
        }
    } else {
        if String(input.first!) == laststr && String(input.last!) == firststr &&  !arr.contains(input){
            print(input)
        }
    }
}
