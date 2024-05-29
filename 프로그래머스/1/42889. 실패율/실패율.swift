import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var numDic = [Int:Int]()
    var failureDic = [Double:[Int]]()
    var ans = [Int]()
    var count = stages.count
    for i in stages {
        if let val = numDic[i] {
            numDic[i] = 1 + val
        } else {
            numDic[i] = 1
        }
    }
    for i in 1...N{
        if let val = numDic[i] {
            if let _ = failureDic[(Double(val)/Double(count))] {
                failureDic[(Double(val)/Double(count))]!.append(i)
            } else {
                failureDic[(Double(val)/Double(count))] = [i]
            }
            count -= val
        } else {
            if let _ = failureDic[0] {
                failureDic[0]!.append(i)
            } else {
                failureDic[0] = [i]
            }
        }
    }
    for i in failureDic.sorted(by: { $0.key > $1.key }) {
        ans.append(contentsOf: i.value.sorted())
    }
    return ans
}