let input = readLine()!
var xarr = input.split(separator: ".").map{String($0)}
var convertarr = [String]()
var ans = ""
var index = 0
var d = false
for i in xarr {
    var temp = ""
    if i.count % 2 == 0 {
        if i.count % 4 == 0{
            for _ in 0..<i.count/4{
                temp += "AAAA"
            }
        } else {
            if i.count / 4 >= 1{
                for _ in 0..<i.count/4{
                    temp += "AAAA"
                }
                for _ in 0..<(i.count%4)/2{
                    temp += "BB"
                }
            } else {
                for _ in 0..<i.count/2{
                    temp += "BB"
                }
            }
        }
        convertarr.append(temp)
    }else {
        ans = "-1"
        break
    }
}
if ans != "-1"{
    for i in input{
        if i == "."{
            ans += "."
            d = false
        } else {
            if d == false {
                ans += convertarr[index]
                index += 1
                d = true
            }
        }
    }
}
print(ans)