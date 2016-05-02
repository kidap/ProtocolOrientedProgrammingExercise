//: Playground - noun: a place where people can play

import UIKit

protocol Bird{
  var name:String {get}
  var canFly: Bool {get}
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



