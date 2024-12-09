let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n1 = firstLine[0]
let n2 = firstLine[1]

let group1 = Array(readLine()!) 
let group2 = Array(readLine()!) 
let t = Int(readLine()!)! 

var ants = Array(group1.reversed() + group2)

var directions = Array(repeating: 1, count: n1) + Array(repeating: -1, count: n2)

for _ in 0..<t {
    var visited = Array(repeating: false, count: ants.count)

    for i in 0..<(ants.count - 1) {

        if directions[i] == 1 && directions[i + 1] == -1 && !visited[i] && !visited[i + 1] {
            ants.swapAt(i, i + 1)
            directions.swapAt(i, i + 1)
            visited[i] = true
            visited[i + 1] = true
        }
    }
}

print(String(ants))