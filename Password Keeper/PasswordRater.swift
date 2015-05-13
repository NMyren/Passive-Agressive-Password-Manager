//
//  PasswordRater.swift
//  Password Keeper
//
//  Created by nmyren on 5/8/15.
//  Copyright (c) 2015 nmyren. All rights reserved.
//

import UIKit

class PasswordRater: NSObject
{
    var score : Int!
    var onlyNumbers = 0
    var onlyLowercase = 0
    
    var symbols = ["!" :  "!", "@" :  "@", "#" :  "#", "$" :  "$", "%" :  "%", "^" :  "^", "&" :  "&", "*" :  "*", "(" :  "(", ")" :  ")", "_" :  "_", "-" :  "-", "+" :  "+", "=" :  "=", "[" :  "[", "{" :  "{", "]" :  "]", "}" :  "}", "\\" :  "\\", "|" :  "|", "," :  ",", "<" :  "<", "." :  ".", ">" :  ">", "/" :  "/", "?" :  "?", ";" :  ";", ":" :  ":", "`" :  "`", "~" :  "~", " " :  " ", "\"" :  "\"", "'" :  "'"]
    
    var lowerCase = ["a" :  "a", "b" :  "b", "c" :  "c", "d" :  "d", "e" :  "e", "f" :  "f", "g" :  "g", "h" :  "h", "i" :  "i", "j" :  "j", "k" :  "k", "l" :  "l", "m" :  "m", "n" :  "n", "o" :  "o", "p" :  "p", "q" :  "q", "r" :  "r", "s" :  "s", "t" :  "t", "u" :  "u", "v" :  "v", "w" :  "w", "x" :  "x", "y" :  "y", "z" :  "z"]
    
    var upperCase = ["A" :  "A", "B" :  "B", "C" :  "C", "D" :  "D", "E" :  "E", "F" :  "F", "G" :  "G", "H" :  "H", "I" :  "I", "J" :  "J", "K" :  "K", "L" :  "L", "M" :  "M", "N" :  "N", "O" :  "O", "P" :  "P", "Q" :  "Q", "R" :  "R", "S" :  "S", "T" :  "T", "U" :  "U", "V" :  "V", "W" :  "W", "X" :  "X", "Y" :  "Y", "Z" :  "Z"]
    
    var numbers = ["0" :  "0", "1" :  "1", "2" :  "2", "3" :  "3", "4" :  "4", "5" :  "5", "6" :  "6", "7" :  "7", "8" :  "8", "9" :  "9"]
    

    var weak = [""]
    
    func analyze(string : String)
    {
        
        var chars = Array(string)
        var excess = 3
        var upper = 4
        var symbol = 5
        var number = 3
        var hasLowercase = false
        var hasUppercase = false
        var hasNumber = false
        var hasSymbol = false
        var numLower = 0
        var numUpper = 0
        var numSymbol = 0
        var numNum = 0
        var excessLength = countElements(string)-8
        for str in chars
        {
            var string = String(str)
            if lowerCase[string] == string
            {
                hasLowercase = true
                numLower++
            }
            if upperCase[string] == string
            {
                hasUppercase = true
                numUpper++
            }
            if numbers[string] == string
            {
                hasNumber = true
                numNum++
            }
            if symbols[string] == string
            {
                hasSymbol = true
                numSymbol++
            }
            
            
        }
        
        if hasUppercase && hasSymbol && hasNumber && hasLowercase
        {
            score = score! + 25
        }
        else if (hasUppercase && hasSymbol) || (hasNumber && hasUppercase)
        {
            score = score! + 15
        }
        if (!hasUppercase && !hasNumber && !hasSymbol)
        {
            score = score! - 15
            onlyLowercase = 1
        }
        if (!hasUppercase && !hasLowercase && !hasSymbol)
        {
            score = score! - 35
            onlyNumbers = 1
            
        }
        score = score! + (excess * excessLength) + (numUpper * upper) + (numNum * number) + (numSymbol * symbol)
    }
    
    func rate (str: String) -> [Int]
    {
 
        var password = str
        var strengthRating = 0
        var commonPass = 0
        var length = countElements(password)
        if length < 8
        {
            score = 0
            strengthRating = 0

        }
        else
        {
            score = 50
            analyze(password)
            if (score < 50)
            {
                strengthRating = 0
            }
            else if (score >= 50 && score < 75)
            {
                strengthRating = 1
            }
            else if (score >= 75 && score < 100)
            {
                strengthRating = 2
            }
            else if (score >= 100)
            {
                strengthRating = 3
            }
           
        }
        var passwordList = PasswordList()
        if passwordList.hasPassword(password)
        {
            commonPass = 1
        }
        var results = [strengthRating, onlyLowercase, onlyNumbers, commonPass]
        return results

    }
    
    
    
    func returnString( pass: String) -> [String]
    {
        
        var weakInsults = ["Really? This is pitiful", "Oh COME ON", "My eight-year old brother could crack this", "All your account are belong to us", "This'll keep a hacker busy for MAYBE a minute", "You're hopeless", "Hope this isn't for anything important", "Are you serious?", "This is not a password"]
        var badInsults = ["This is better than the baseline, but barely", "This'll keep a hacker busy for MAYBE an hour", "Please tell me this isn't your best", "Christ", "Honestly, I'm disappointed", "The NSA thanks you", "This is a password? Please", "Is this really your best?"]
        var acceptableInsults = ["This is a C-", "This'll keep a hacker busy for MAYBE a day", "You're getting there...finally","A for effort", "Not bad, for a 5 year old", "You're getting warmer", "I almost might consider using this", "Congrats on learning how to walk"]
        var good = ["I'd use this for my weak accounts", "Well, you finally made it", "Good luck remembering this", "It's acceptable, I guess", "Fine. You can stop now", "That's enough"]
        var lowerLetterOnlyInsults = ["REALLY? No numbers, symbols? Anything?", "Lowercase only? You're hopeless"]
        var numbersOnlyInsults = ["This is rediculous. NUMBERS ONLY?", "Do you have ANY IDEA how weak this is?", "Your neighborhood hacker thanks you for only using numbers"]
        var results = rate(pass)
        if results[3] == 1
        {
            return ["f", weakInsults[0]]
        }
        else if (results[1] == 1 && results[0] != 3)
        {
            return ["f", lowerLetterOnlyInsults[0]]
        }
        else if (results[2] == 1 && results[0] != 3)
        {
            return ["f", numbersOnlyInsults[0]]
        }
        else if (results[0] == 0)
        {
            return ["f", numbersOnlyInsults[0]]
        }
        else if (results[0] == 1)
        {
            return ["d", badInsults[0]]
        }
        else if (results[0] == 2)
        {
            return [ "c", acceptableInsults[0]]
        }
        else if (results[0] == 3)
        {
            return ["a", good[0]]
        }
        else
        {
            return [""]
        }
    }
 
    
    
    
}
