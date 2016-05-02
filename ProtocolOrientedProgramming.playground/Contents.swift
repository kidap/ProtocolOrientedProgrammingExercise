//: Playground - noun: a place where people can play

import UIKit

protocol Bird:BooleanType{
  var name:String {get}
  var canFly: Bool {get}
}

extension BooleanType where Self:Bird{
  var boolValue: Bool{
    return self.canFly
  }
}

protocol Flyable{
  var airSpeedVelocity: Double {get}
}

struct FlappyBird:Bird,Flyable{
  let name:String
  let flappyAmplitude:Double
  let flappyFrequency:Double
  //  let canFly = true
  
  var airSpeedVelocity: Double{
    return 3 * flappyFrequency * flappyAmplitude
  }
}

struct Penguin:Bird{
  let name:String
  let canFly = false
}

struct SwiftBird: Bird, Flyable{
  var name: String
  let version:Double
  //  let canFly = true
  
  var airSpeedVelocity: Double{
    return 2000.0
  }
}

extension Bird where Self:Flyable{
  //Flyable birds can fly
  var canFly:Bool {
    return true
  }
}

var sb = SwiftBird(name: "Swift Bird", version: 1.0)
sb.canFly


enum UnladenSwallow: Bird, Flyable{
  case African
  case European
  case Unknown
  
  var name:String{
    switch self{
    case .African:
      return "African"
    case .European:
      return "European"
    case .Unknown:
      return "What do you mean? African or European"
    }
  }
  
  var airSpeedVelocity: Double{
    switch self{
    case .African:
      return 10.0
    case .European:
      return 9.9
    case .Unknown:
      fatalError("You are thrown from the bridge of death!")
    }
  }
  
}

if UnladenSwallow.African {
  print("I can fly!")
} else {
  print("Guess I’ll just sit here :[")
}



extension CollectionType{
  func skip(skip:Int) ->[Generator.Element]{
    guard skip != 0 else {return []}
    
    var index = self.startIndex
    var result:[Generator.Element] = []
    var i = 0
    
    repeat{
      if skip != i{
        result.append(self[index])
      }
      index = index.successor()
      i += 1
      
    } while (index != self.endIndex)
    
    return result
  }
  
}



var x = ["frog","pants"].map { $0.length }.reduce(0) { $0 + $1 }

print(x)


func topSpeed<T: CollectionType where T.Generator.Element == Flyable>(c: T) -> Double {
  return c.map { $0.airSpeedVelocity }.reduce(0) { max($0, $1) }
}

let flyingBirds: [Flyable] =
  [UnladenSwallow.African,
   UnladenSwallow.European,
   SwiftBird(name: "SB",version: 2.0)]

topSpeed(flyingBirds)
























































