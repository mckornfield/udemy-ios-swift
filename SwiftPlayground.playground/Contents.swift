var age = 123

age

age = 35

age

let finalAge = 12

var wallet = 13

// Got paid
wallet = 94

// Got paid again
wallet = 194

print(wallet)

var weather = "Sunny"

let firstName = "matt"

let height = 70

// Here is my comment

print("Hey my name is " + firstName)

// My own comment
print("My own thing to print")


// If statements

let kidsHeight = 50

if kidsHeight >= 50 {
    print("You can go on the ride")
} else if(kidsHeight == 49){
    print("Give me money and you can ride")
} else {
    print("YOU ARE FORBIDDEN FROM RIDING")
}

// if greater than or equal to 80, print it's hot, otherwise print nice weather
var temp = 81
if temp >= 80 {
    print("it's hot!")
} else {
    print("nice weather!")
}

// Math and doubles

3 + 4

4 - 5

5 * 5

6 / 5.0

let a = 5
let b = 2

let c = a + b

3.0 / 4

3.1519 * 5

let a2 = 5.1
let b2 = 5

Int(a2) + b2

let daysInYear : Float = 365
let daysInWeek : Float = 7.0

daysInYear / daysInWeek

let weeksInYear = 365 / 7.0

// Floats and more math

var days = 1

// Long way
days = days + 1

// Same thing
days += 1


// String interpolation
let name = "Matt"
let personsAge = 25
print("Hi my name is \(name) and I am \(personsAge) years old")

var sunny : Bool = false

if sunny {
    print("The weather is nice")
} else {
    print("The weather is stinky")
}

var bestCandy = ["Twix", "Snickers","Crunch"]

bestCandy.append("abc")
bestCandy.insert("omg new thing", at: 1)
print(bestCandy)
bestCandy.remove(at:1)
print(bestCandy)

// Make an array of favorite movies
//

var favoriteMovies = ["Lord of the Rings","The Matrix","Iron Man"]
favoriteMovies.remove(at: 2)


func printMessage(){
    print("Have a good day")
}
printMessage()

func sayHappyBirthday(person: String){
    print("Happy birthday \(person)!")
}

sayHappyBirthday(person: "Mike")

sayHappyBirthday(person: "Sean")

func addInts(first: Int, second: Int){
    print(String(first + second))
}
addInts(first:1, second: 2)

func addNumbers(first: Int, second: Int) -> Int{
    return first + second
}

var sum = addNumbers(first:1,second:2)

print(sum)

// Takes 2 ints, multiplies and returns a double

func multiply(first: Int, second: Int) -> Double{
    return Double(first*second)
}

multiply(first: 2, second: 3)

class Dog {
    var name = ""
    var furColor = ""
    var age = 0
    
    func bark(){
        print("Woof woof")
    }
    
    func dogInfo(){
        print("This dog is \(name) it is \(age) year(s) old and its fur is \(furColor)")
    }
    
    func doubleAge(){
        age = age * 2
    }
}

var dog1 = Dog()

dog1.name = "abc"
dog1.furColor = "white"
dog1.age = 6
dog1.bark()
dog1.dogInfo()
dog1.doubleAge()
dog1.dogInfo()
var dog2 = Dog()

class Bike {
    var color = ""
    var material = ""
    var tirePressure = 0
}

var bike = Bike()
bike.color = "Green"
bike.material = "Aluminum"
bike.tirePressure = 35

// Optionals

var weather2 : String? = "abc"

print(weather2)
var ab = "asd"
var newNumber = Int(ab)

if newNumber != nil {
    print(newNumber!)
}

if let newerNumber = weather2 {
    print(newerNumber)
}

// Dictionaries

var dogInfo : [String:Int] = ["Fido": 5, "Sean": 19, "Sara": 43]

dogInfo["Sean"]
dogInfo["Fido"]
dogInfo["John"] = 77

dogInfo

// Make a dictionary with doubles for keys and bools for values

var dict : [Double:Bool] = [1.0: true, 2.0: false, 1.5: true]

dict[2.0]
