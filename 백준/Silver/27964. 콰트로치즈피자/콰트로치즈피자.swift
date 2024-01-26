let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ")
var count = 0
var set = Set(input)
for i in set{
    if i.count > 5 {
        let removeCount = i.count - 6
        if "Cheese" == i.dropFirst(removeCount){
            count += 1
        }
    }
}
count >= 4 ? print("yummy") : print("sad")
