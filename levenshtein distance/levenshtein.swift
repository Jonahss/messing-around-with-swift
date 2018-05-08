// calculate levenshtein distance between two strings
print("starting")
var strA = "hello, playground"
var strB = "yellow fairgrounds"

var savedDistances : [String : [String : Int]] = [:]

func levenshteinDistance (_ a:String, _ b:String) -> Int {
    if a.elementsEqual(b) {
        return 0
    }

    // if one string is empty, the distance will be the legnth of the remaining string, because all those characters need to be added
    if (a.count == 0) { return b.count }
    if (b.count == 0) { return a.count }

    if (savedDistances[a]?[b] != nil) {
      return savedDistances[a]![b]!
    }

    let distance = min(
        levenshteinDistance(String(a.dropLast()), b) + 1, // remove character
        levenshteinDistance(a, String(b.dropLast())) + 1, // add character
        levenshteinDistance(String(a.dropLast()), String(b.dropLast())) + (a.last! == b.last! ? 0 : 1)// replace current character with another, if they're not already the same
    )

    if (savedDistances[a] == nil) {
      savedDistances[a] = [String : Int]()
    }
    savedDistances[a]![b] = distance
    return distance
}

print(levenshteinDistance(strA, strB))
