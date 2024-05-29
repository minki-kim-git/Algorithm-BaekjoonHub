import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var ans = ""
    var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    _ = skip.map { alphabet.remove(at: alphabet.firstIndex(of: String($0))!) }
    for i in s {
        var num = alphabet.firstIndex(of:String(i))!
        if num + index >= alphabet.count {
            var sum = num + index
            while sum >= alphabet.count {
                sum -= alphabet.count
            }
            ans += alphabet[sum]
        } else {
            ans += alphabet[num+index]
        }
    }
    return ans
}