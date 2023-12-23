func solution(_ strings:[String], _ n:Int) -> [String] {
    var arr = Array(repeating:Array(repeating:"",count:0),count:26)
    for i in strings{
        var str = i.map{String($0)}
        switch str[n]{
        case "a":
            arr[0].append(i)
     case "b":
         arr[1].append(i)
    case "c":
     arr[2].append(i)
    case "d":
    arr[3].append(i)
    case "e":
    arr[4].append(i)
    case "f":
    arr[5].append(i)
    case "g":
     arr[6].append(i)
    case "h":
     arr[7].append(i)
    case "i":
     arr[8].append(i)
    case "j":
     arr[9].append(i)
    case "k":
     arr[10].append(i)
    case "l":
     arr[11].append(i)
    case "m":
     arr[12].append(i)
    case "n":
     arr[13].append(i)
    case "o":
     arr[14].append(i)
    case "p":
     arr[15].append(i)
    case "q":
    arr[16].append(i)
    case "r":
     arr[17].append(i)
    case "s":
     arr[18].append(i)
    case "t":
     arr[19].append(i)
    case "u":
     arr[20].append(i)
    case "v":
    arr[21].append(i)
    case "w":
     arr[22].append(i)
    case "x":
     arr[23].append(i)
    case "y":
     arr[24].append(i)
    case "z":
     arr[25].append(i)
    default:
        break
        
        }
    }
    var ans = [String]()
    for i in arr{
        for j in i.sorted(){
           ans.append(j) 
        }
    }
    return ans
}