//
//  main.swift
//  ClassesDemo
//
//  Created by Matheus on 13/04/22.
//

let skeleton = Enemy(health: 100.0, power: 150)
let superSkeleton = SuperEnemy(health: 100.0, power: 250, wingSpan: 15)


skeleton.move()
skeleton.attack()

superSkeleton.move();
superSkeleton.attack()
superSkeleton.talk(speech: "My teeth are swords! My cclaws are spears! My wings are a hurricane!")
