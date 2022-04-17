//
//  Enemy.swift
//  ClassesDemo
//
//  Created by Matheus on 14/04/22.
//

import Foundation

class Enemy {
    var health: Double
    var power: Int
    
    init(health: Double, power: Int) {
        self.health = health
        self.power = power
    }
    
    func move(){
        print("Walk forwards.")
    }
    
    func attack(){
        print("Land a hit, does \(self.power) damage.")
    }
}
