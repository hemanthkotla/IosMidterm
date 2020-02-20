import SpriteKit
import GameplayKit

class Island: GameObject
{
    
    
    //constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life Cycle Functions
    override func CheckBounds()
    {
        // bottom boundary
        if(self.position.x < -896)
        {
            self.Reset()
        }
        
        // right boundary
        if(self.position.y >= 220 - self.halfWidth!)
        {
            self.position.y = 220 - self.halfWidth!
        }
        
        // left boundary
        if(self.position.y <= -220 + self.halfWidth!)
        {
            self.position.y = -220 + self.halfWidth!
        }
    }
    
    func Move()
    {
        self.position.x -= self.dx!
    }
    
    override func Reset()
    {
        self.position.x = 896
        let randomX:Int = (randomSource?.nextInt(upperBound: 614))! - 220
        self.position.y = CGFloat(randomX)
        self.isColliding = false
    }
    
    override func Start()
    {
        self.zPosition = 1
        self.Reset()
        self.dx = 5.0
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
}
