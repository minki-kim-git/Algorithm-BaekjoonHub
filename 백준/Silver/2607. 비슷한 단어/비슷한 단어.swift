func compareWord(lArr:[String],sArr:[String]) -> Int {
    var count = 0
    var larr = lArr
    var sarr = sArr
    while true {
        if larr.last! != sarr.last! {
            larr.removeLast()
            count += 1
        } else {
            larr.removeLast()
            sarr.removeLast()
        }
        if larr.isEmpty || sarr.isEmpty {
            break
        }
    }
    count += sarr.count + larr.count
    return count
}
func compareEqualLenWord(lArr:[String],sArr:[String]) -> Int {
    var count = 0
    var larr = lArr
    var sarr = sArr
    for i in stride(from: larr.count-1, through: 0, by: -1){
        if larr[i] == sarr[i] {
            larr.remove(at: i)
            sarr.remove(at: i)
        }
    }
    for i in larr {
        if sarr.contains(i) {
            sarr.remove(at: sarr.firstIndex(of: i)!)
        }
    }
    return sarr.count
}
var ans = 0
let n = Int(readLine()!)!
var word = readLine()!.map{String($0)}.sorted()
for _ in 0..<n-1 {
    var count = 0
    let input = readLine()!.map{String($0)}.sorted()
    let temp = word
    if word.count < input.count {
        count = compareWord(lArr: input, sArr: word)
    } else if word.count == input.count {
        count = compareEqualLenWord(lArr: input, sArr: word)
    } else {
        count = compareWord(lArr: word, sArr: input)
    }
    if count < 2 {
        ans += 1
    }
    word = temp
}
print(ans)