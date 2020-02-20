//Name : Hemanth Kotla
//Student Id : 301084656
// test date : 19-Feb-2020







import SpriteKit
import GameplayKit

class Cloud: GameObject
{
    
    
    //constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
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
        
    }
    
    func Move()
    {
        self.position.x -= self.dx!
        self.position.y -= self.dy!
    }
    
    override func Reset()
    {
        self.position.x = 896
        let randomX:Int = (randomSource?.nextInt(upperBound: 614))! - 307
        self.position.y = CGFloat(randomX)
        self.dx = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        self.dy = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        self.isColliding = false
    }
    
    override func Start()
    {
        self.zPosition = 4
        self.Reset()
        self.alpha = 0.5
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
    
    
}
