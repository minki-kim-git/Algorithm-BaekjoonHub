import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var vis = Array(repeating: 0, count: words.count)
    var queue = [(begin,0)]
    var index = 0
    var words = words
    if let val = words.firstIndex(of: begin) {
        words.remove(at: val)
    }
    while queue.count > index {
        for i in 0..<begin.count {
            var str = queue[index].0
            str.remove(at: str.index(str.startIndex, offsetBy: i))
            var words = words
            for j in words.enumerated() {
                if vis[j.offset] != 0 {
                    continue
                }
                var word = j.element
                word.remove(at: word.index(word.startIndex, offsetBy: i))
                if word == str {
                    vis[j.offset] = 1 + vis[queue[index].1]
                    queue.append((j.element,j.offset))
                    if j.element == target {
                        return vis[j.offset]
                    }
                }
            }
        }
        index += 1
    }
    return 0
}

