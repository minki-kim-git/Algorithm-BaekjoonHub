func solution(_ s:String, _ n:Int) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz").map { String($0) }
    var ans = ""
    for str in s.map({String($0)}){
        if str == " "{
            ans += " "
        } else {
            if str == str.uppercased() {
                let index = alphabet.firstIndex(of: str.lowercased())!
                if index + n > 25{
                    ans += alphabet[index + n - 26].uppercased()
                } else {
                    ans += alphabet[index + n].uppercased()
                }
            } else if str == str.lowercased() {
                let index = alphabet.firstIndex(of: str)!
                if index + n > 25{
                    ans += alphabet[index + n - 26]
                } else {
                    ans += alphabet[index + n]
                }
            }
        }
    }
    return ans
}