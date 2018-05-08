// calculate longest common subsequence between two strings

var sequenceA = "hannah banana ; abcghimnqruvy"
var sequenceB = "defjklopstwxz ; anna's katana"

// save values from previous runs
var memo : [String : [String : String]] = [:]

func lcs (_ a:String, _ b:String) -> String {
  // if we've already calculated the longest common subsequence for these two strings, return the result we got last time
  if let savedLCS = memo[a]?[b] {
    return memo[a]![b]!
  }

  var leastCommonSubsequence:String

  // if one sequence is empty, there are no common elements between the two sequences
  if a.count == 0 || b.count == 0 {
    leastCommonSubsequence = ""
  }

  // if the two sequences end in the same value, that value must be in the longest common subsequence
  else if a.last! == b.last! {
    var lastValueInSequence = String(a.last!)
    leastCommonSubsequence = lcs(String(a.dropLast()), String(b.dropLast())) + lastValueInSequence
  }

  else {
    // if the two sequences end in different values, then one of them can be shorter, but we don't know which one yet. So let's do both and take the better answer.
    var shorterA = lcs(String(a.dropLast()), b)
    var shorterB = lcs(a, String(b.dropLast()))

    if shorterA.count > shorterB.count {
      leastCommonSubsequence = shorterA
    } else {
      leastCommonSubsequence = shorterB
    }
  }

  saveMemo(a, b, lcs: leastCommonSubsequence)
  return leastCommonSubsequence
}

func saveMemo (_ a:String, _ b:String, lcs:String) {
  if memo[a] == nil {
    memo[a] = [:]
  }
  memo[a]?[b] = lcs
}

print(lcs(sequenceA, sequenceB))
