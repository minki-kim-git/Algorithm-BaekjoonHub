let input = readLine()!
var str = ""
for i in input {
    str += String(i)
    if str.suffix(4) == "PPAP"{
        str.removeLast(4)
        str += "P"
    }
}
if str == "P" {
    print("PPAP")
} else {
   print("NP")
}