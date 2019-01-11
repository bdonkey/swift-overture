import Foundation
import Overture

func incr(_ x: Int) -> Int {
    return x + 1
}

func square(_ x: Int) -> Int {
    return x * x
}

[1, 2, 3].map(pipe(incr, square, String.init))

//ss s
let sinc = incr //(Int) -> Int
String.init(4)
let si = String.init(data:encoding:)
let ssCurry = curry(String.init(data:encoding:))
//ss e
let stringWithEncoding = flip(curry(String.init(data:encoding:)))

let utf8String = stringWithEncoding(.utf8)

//ss s
let sscap = String.capitalized
"scott".capitalized
["scott"].map(String.capitalized) //works
["scott"].map(flip(String.capitalized)(Locale(identifier: "en")))

//ss e

let capitalized = flip(String.capitalized)

["hello, world", "and good night"]
    .map(capitalized(Locale(identifier: "en")))

// start scott
["hello, world", "and good night"]
    .map(String.capitalized)
// end scott



get(\String.count)

["hello, world", "and good night"]
    .map(get(\.count))

pipe(incr, square, String.init, get(\.count))

//scott try pipe .. for keyPath see http://bit.ly/2QCAcs6 and http://bit.ly/2HgHguv
[14].map(pipe(incr, square, String.init, get(\.count)))
//

struct User {
    var name: String
    var age: Int
}

let setUserName = prop(\User.name)
let capitalizeUserName = setUserName(capitalized(Locale(identifier: "en")))

let setUserAge = prop(\User.age)
let celebrateBirthday = setUserAge(incr)

with(User(name: "blob", age: 1), concat(
    capitalizeUserName,
    celebrateBirthday
))

// start scott
let ub = User(name: "blob", age: 1)
with(ub, concat(
    capitalizeUserName,
    celebrateBirthday
))
ub.name //blob
ub.age // 1
// end scott

// start scott try to use mutating props but fails
let msetUserName = mprop(\User.name)
//let mcapitalizeUserName = msetUserName(capitalized(Locale(identifier: "en")))

let msetUserAge = mprop(\User.age)
// 2019-01-10 need a mutating inc function
//let mcelebrateBirthday = msetUserAge(incr)

/*
with(ub, concat(
    mcapitalizeUserName,
    mcelebrateBirthday
))
*/

// end scott


