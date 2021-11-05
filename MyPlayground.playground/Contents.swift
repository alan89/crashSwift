import UIKit
import Foundation // tricardo: I use this library to have access to the string method `replacingOccurrences(of:string, with:string)`

var firstVariable = "Hello, playground"

var age = 32
var population = 8_000_000

var claim = """
This goes
a multiple line
string
"""

var pi = 3.1416

var awesome = true

var writtenAge = "Your age is \(age) and you are old"

let album: String = "Reputation"
let year: Int = 1989
let isItGood: Bool = true

let john = "John Lennon"
let paul = "Paul McCartney"

let beatles = [john, paul]
beatles[0]

var colors = Set(["red", "blue", "yellow"])
colors.first
colors.insert("purple")

colors

var name = (first: "Alan", lastname: "Escobar")
name.0 = "Pedro"

name

// Let's assume that you want to sum all the numbers between
// 0 and 100, but you don't have a calculator or computer.
// How would you do that?

// Arithmetic operators
let firstScore = 12
let secondScore = 4

let sumTotal = firstScore + secondScore
let subTotal = firstScore - secondScore
let multTotal = firstScore * secondScore
let divTotal = firstScore / secondScore
let modTotal = firstScore % secondScore

// Overloading
let fakers = "Fakers gonna "
var action = fakers + "fake"

let firstHalf = ["John"]
let secondHalf = ["Paul"]
let completeBand = firstHalf + secondHalf

// Compound Operators
var score = 95
score -= 5
score += 10

action += " . This is true"

// Comparison Operators
firstScore == secondScore
firstScore != secondScore
firstScore < secondScore
firstScore >= secondScore

"Dave" <= "Grohl"

// Conditions
if firstScore + secondScore == 16 {
    print("This is true")
}

if firstScore + secondScore == 18 {
    print("This is true")
} else {
    print("This is false")
}

if firstScore + secondScore == 18 {
    print("This is true")
} else if firstScore + secondScore == 16 {
    print("This is true in the second if")
} else {
    print("This is false")
}

// Combining operators
// && ||
if firstScore > 10 || secondScore < 2 {
    // true      ||      false
    print("The values are correct")
} else {
    print("The condition is not achieved")
}

// Ternary Operator
print(firstScore == 12 ? "scores are the same": "scores are different")

if firstScore == 12 {
    print("scores are the same")
} else {
    print("scores are different")
}

// Switch
let weather = "sunny"

switch weather {
case "rainy":
    print("Bring an umbrella")
case "cloudy":
    print("Bring a sweater")
case "sunny":
    print ("Wear sunglasses")
    fallthrough
default:
    print ("enjoy the day")
}

// Range operators
let range = 0 ... 12
switch firstScore {
case range:
    print("This is true")
default:
    print("default")
}

// FUNCTIONS
// DRY: Don't repeat yourself
// One responsibility

func greeting() {
    let message = "Welcome to Firebase"
    print(message)
}
greeting()

func greetingCustomized(name: String) -> String {
    let message = "Welcome to Firebase " + name
    return message
}
let greetingResult = greetingCustomized(name: "César")
print(greetingResult)

func greet(_ name: String, nicely: Bool = true) -> String {
    var message = ""
    if nicely == true {
        message = "Welcome to Firebase " + name
    } else {
        message = "Oh no, here comes again " + name
    }
    return message
}
print(greet("Adrián",nicely: false))

// Variadic Functions
print("Swift ", "is ", "nice")

func square(_ numbers: Int...){
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(1,2,3)

// Throwing functions
enum PasswordError: Error {
    case obvious
    case notNumbers
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("The password is good")
} catch {
    print("You can't use the word 'password' as your password")
}

var firstNumber = 2

func doubleInPlace(number: inout Int) {
    number *= 2
}
doubleInPlace(number: &firstNumber)
print(firstNumber)

// Count the number of Duplicates
// Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
//
// Examples
// "abcde" -> 0 # no characters repeats more than once
// "aabbcde" -> 2 # 'a' and 'b'
// "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
// "Indivisibility" -> 1 # 'i' occurs six times
// "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
// "aA11" -> 2 # 'a' and '1'
// "ABBA" -> 2 # 'A' and 'B' each occur twice

// convert the string to uppercase
// for to go through the array (possible 2 for's)
// compare each char with the rest
// separate the string in individual chars
// two for's to compare each character
// recursivity in functions

func countDuplicates(s: String) -> Int {
    let string = s.lowercased() // abba
    var dicDuplicates = [Character: Int]() // [a:2, b:2]
    var dupCounter = 0 // 2
    for char in string {
        if dicDuplicates[char] != nil { // dicDuplicates[b] == nil
            dicDuplicates[char]! += 1
            if dicDuplicates[char]! == 2 {
                dupCounter += 1
            }
        } else {
            dicDuplicates[char] = 1
        }
    }
    return dupCounter // 2
}
countDuplicates(s: "aA11")


//Recursive form of countDuplicates
func countDuplicatesRecursive(str: String) -> Int {
    // I use this function only for pass the real function a lowercase string.
    // the problem is no case sensitive   
    return auxCountDuplicatesRecursive(str: str.lowercased())
}

/**
  
  `Given an string it returns how many characters are repeated at least two times`

  This is a recursive function, because in the definition of the function it calls itself
  in order to complete the result.
  All recursive functions has two important thing.
  	1. A base: 
  		If a recursive function has not a base, the function will run forever and functions
  		that does not conclude are useless.

  		Case bases are very simple to solve, in this example, the string "" represent the "empty string" i.e a string
  		without characters. If a string has no characters then doesn't have any character duplicate, this implies that:

		```
		auxCountDuplicatesRecursive(str: "") == 0
		```

  	2. The recursive step:
  		This is when the function calls to itself. You must remember that you need
  	 	apply the recursive step with parameters that are "minor" or "less dificult" (This is a talk for other moment,
  	 	if someone are interested i'm refer that in order to apply recursive functions you must have at least a "partial order").

  	 	In this case when apply the function to a string I'm always apply in the recursive step an string without certain characters.
  	 	(The characters that are equal to the head, ie, to the first character on the string).

  	 	```
  	 	auxCountDuplicatesRecursive(str: "ABBA") == 1 + auxCountDuplicatesRecursive("BB") == 1 + 1 + auxCountDuplicatesRecursive(str: "") == 1+1+0 == 2
  	 	```
 */

func auxCountDuplicatesRecursive(str: String) -> Int {
    if (str ?? "").isEmpty { return 0; }
    let head = String(str.first!)
    let tail = String(str.dropFirst())
    let value = tail.contains(head) ? 1 : 0
    return value + auxCountDuplicatesRecursive(str: tail.replacingOccurrences(of: head, with: ""))
}

print(countDuplicatesRecursive(str: "Oooorale"))
print(countDuplicatesRecursive(str: "AaBb"))

// LOOPS

// for
let rangeFor = 4..<8
for number in rangeFor {
    print ("\(number) is the index")
}

for _ in  1...5 {
    print ("play")
}

// while
var numberWhile = 1
while numberWhile <= 5 { // 6 <= 5 -> false
    print(numberWhile)
    numberWhile += 1
}

// repeat
var numberRepeat = 25
repeat {
    print(numberRepeat)
    numberRepeat += 1
} while (numberRepeat <= 23)

// breaks
var countDown = 5
while countDown >= 0 {
    print("\(countDown) countdown")
    if countDown == 4 {
        print("counting down is boring")
        break
    }
    countDown -= 1
}

// Exiting multiples loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// Skipping items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}

// Closures
let driving = {
    print("I'm driving in my car")
}
driving()

// Accepting parameters in closures
let drivingParameters = { (place: String) in
    print("I'm going to \(place) in my car")
}
drivingParameters("London")

// Returning values in closures
let drivingParamsReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingParamsReturn("London")
print(message)

// Closures as parameters
func travel(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived!")
}
travel(action: driving)

// Trailing closure syntax
travel {
    print("driving my car")
}

// Using closures as parameters
// when they accept parameters
func travelParam(action: (String) -> Void) {
    print("I'm getting ready to go")
    action("London")
    print("I arrived!")
}
travelParam { (place:String) in
    print("I'm going to \(place) in my car")
}


// EXERCISE
// Write a function that takes a message as an array of characters
// and reverses the order of the words in place. E.g.
// Input: [‘o’, ‘n’, ‘e’, ‘ ‘, ’t’, ‘w’, ‘o’, ‘ ‘, ‘t’, ’h’, ‘r’, ‘e’, ‘e’]
// Input : "one two three"
// Output: [‘t’, ’h’, ’r’, ’e’, ‘e’, ‘ ‘, ‘t’, ‘w’, ‘o’, ‘ ‘, ‘o’,’n’,’e’].
// Input : "three two one"

// using 2 lists: list2 = input, list1 = array of words
// going through the input array until we find a space char
// store the previous array of chars in list1 = ["one", "two", "three"]
// going through list1, starting in the last element, and countdown until the first one
// concat all the words and return the final array (String)

func reverseWords(string: String) -> String {
    var resultString = ""
    var helperArray : [String] = [""]
    var counterHelper = 0
    for char in string {
        if char == " " {
            counterHelper += 1
            helperArray.append("")
        }
        helperArray[counterHelper].append(char)
    }
    helperArray = helperArray.reversed()
    for internalArray in helperArray {
        resultString.append(contentsOf: internalArray)
        if counterHelper > 0 {
            resultString.append(" ")
        }
        counterHelper -= 1
    }
    return resultString
}
var charArray = "one two three four five six  seven"
reverseWords(string: charArray)

// 
