import SpriteKit
import GameplayKit

class Night : GameObject
{
    //constructor
    init()
    {
        super.init(imageString: "level2", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //GameObject Life Cycle Functions
    override func CheckBounds()
    {
           
        // check top boundary
        if(self.position.x <= -800) // note maybe reset earlier
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        self.position.x = 800
    }
    
    override func Start()
    {
        self.zPosition = 1
        //self.Reset()
        self.dx = 5.0
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        self.position.x -= self.dx!
    }

}
