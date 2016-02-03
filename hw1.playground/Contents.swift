//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: [EXPLAIN YOUR ANSWER HERE]: The values passed in to the **init** function,wordA and wordB, are Implicitly Unwrapped Optional Strings (because of !). In other words we don't need to unwrap this kind of variable when accessing the value, and they can be used without additional syntax. According to Apple's documentation: "Implicitly unwrapped optionals should not be used when there is a possibility of a variable becoming nil at a later point. Always use a normal optional type if you need to check for a nil value during the lifetime of a variable". Those set in the instance variable are optionals (because of ?). If we want the actual value of that variable, we must unwrap it.

//: ## Q2: Variable Types and Function Types
    static func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
//: ### Why does the compiler dislike the **for loop**? Fix it.
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: [EXPLAIN YOUR ANSWER HERE]: The compiler dislikes the **for loop** because i is defined as a let variable. The let keyword defines a constant, which cannot be changed. However, in this for loop, we are trying to change the value of the constant i, by incrementing (which is not allowed with let). We should define i as a var instead as var can be changed. We also needed to change numElements to a let as we never changed its value in the function. The second change is that we also need to return true if all words are palindromes. The last change that I did is to add the static keyword before func. As we define methods that are called on the type itself by writing the static keyword before the method’s func keyword.


//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters = [Character : Int]()
        let lenA = self.wordA.characters.count
        let lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: [EXPLAIN YOUR ANSWER HERE]: countLetters is not properly initialized. Therefore, when we use it we are going to have an error. To initialize a dictionary we need = and at the end (). I also had to remove the class keyword from class func as the function is manipulating an instance of a type Words. When we have a function that deals with instance of a type we need to only put func. Lastly the function returns a bool therefore we need to return false or true (not nil). Therefore, at the end the function we must return true. For the warnings, I replaced the var of lenA and lenB to let as the values of lenA and lenB are not changed. I then changed letter to _ because letter is an immutable value that is never used. Therefore it is better to use _ (in terms of style).
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
