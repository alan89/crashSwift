import UIKit

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
// "indivisibility" -> 1 # 'i' occurs six times
// "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
// "aA11" -> 2 # 'a' and '1'
// "ABBA" -> 2 # 'A' and 'B' each occur twice

