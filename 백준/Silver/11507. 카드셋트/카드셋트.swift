let input = readLine()!.map{String($0)}
var arr = Array(repeating: Array(repeating: "", count: 13), count: 4)
var ans = [13,13,13,13]
var duplication = false
func appendarr(index:Int,num:Int) -> Bool{
    if arr[index][num-1] != "" {
        duplication = true
        return false
    } else {
        arr[index][num-1] = "1"
        ans[index] -= 1
    }
    return true
}

for i in stride(from: 0, to: input.count, by: 3) {
    let num = input[i+1] + input[i+2]
    switch input[i] {
    case "P":
        if !appendarr(index: 0, num: Int(num)!) {
            break
        }
    case "K":
        if !appendarr(index: 1, num: Int(num)!) {
            break
        }
    case "H":
        if !appendarr(index: 2, num: Int(num)!) {
            break
        }
    case "T":
        if !appendarr(index: 3, num: Int(num)!) {
            break
        }
    default:
        break
    }
}
if duplication == true {
    print("GRESKA")
} else {
    _ = ans.map{ print($0,terminator: " ") }
}