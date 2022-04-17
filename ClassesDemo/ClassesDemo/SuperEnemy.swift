

class SuperEnemy: Enemy {
    
    var wingSpan: Int
    
    init(health: Double, power: Int, wingSpan: Int) {
        self.wingSpan = 15
        super.init(health: health, power: power)
    }
    
    func talk(speech: String){
        print("Says: \(speech).")
    }
    
    override func move() {
        print("Fly forwards.")
    }
}
