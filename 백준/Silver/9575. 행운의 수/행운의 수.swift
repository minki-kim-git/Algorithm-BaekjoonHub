let n = Int(readLine()!)!
for _ in 0..<n{
    let _ = Int(readLine()!)!
    let sequenceA = readLine()!.split(separator: " ").map{Int(String($0))!}
    let _ = Int(readLine()!)!
    let sequenceB = readLine()!.split(separator: " ").map{Int(String($0))!}
    let _ = Int(readLine()!)!
    let sequenceC = readLine()!.split(separator: " ").map{Int(String($0))!}
    var ansSet: Set<Int> = []
    for i in sequenceA{
        for j in sequenceB {
            for k in sequenceC{
                let num = i + j + k
                let filter = String(num).filter {
                    !($0 == "5" || $0 == "8")
                }
                if filter.isEmpty{
                    ansSet.insert(num)
                }
            }
        }
    }
    print(ansSet.count)
}
