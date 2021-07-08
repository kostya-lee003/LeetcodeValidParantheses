import UIKit

///https://leetcode.com/problems/valid-parentheses/
///
///  ### Easy Leetcode problem ###
///
/// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
///
///   An input string is valid if:
///
///   Open brackets must be closed by the same type of brackets.
///   Open brackets must be closed in the correct order.
///
///
/// Example 1:
/// Input: s = "()"
/// Output: true
///
/// Example 2:
/// Input: s = "()[]{}"
/// Output: true
///
/// Example 3:
/// Input: s = "(]"
///
/// Example 4:
/// Input: s = "([)]"
/// Output: false
///
/// Example 5:
/// Input: s = "{[]}"
/// Output: true
///
///


class Solution {
    var stack: [String] = []
    
    func addTo(_ element: String) {
        stack.insert(element, at: 0)
    }
    
    func remove() {
        stack.remove(at: 0)
    }
    
    func isEven(_ n: Int) -> Bool {
        if(n % 2 == 0){
            return true
        }
        else{
            return false
        }

    }
    func isValid(_ s: String) -> Bool {
    
        let parantheses = ["(", ")"]
        let squareBraces = ["[", "]"]
        let curlyBraces = ["{", "}"]
        
        //" ( [ { } ] ) "
        
        var braces = [parantheses, squareBraces, curlyBraces]
        
                
        if isEven(s.count){
           var i = 0
            
            while i < s.count {
                var index = s.index(s.startIndex, offsetBy: i)
                
                if s[index] == "(" || s[index] == "[" || s[index] == "{" {
                    addTo("\(s[index])")
                }
                else if s[index] == ")" || s[index] == "]" || s[index] == "}" {
                    
                    var a = 0
                    while a < braces.count {
                        var brace = braces[a]
                        
                        if brace[0] == stack[0] && brace[1] == "\(s[index])" {
                            remove()
                            break
                        }
                        if a == braces.count - 1 {
                            return false
                        }
                        a += 1
                    }
                    
                }
                
                i += 1
            }
            if stack.count == 0 {
                return true
            }
        }
        
        return false
    }
    
}

//print(Solution().isValid("(({[]}))()[]{}"))
//    ( [ { } ] )
