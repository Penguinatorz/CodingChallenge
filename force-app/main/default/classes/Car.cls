public class Car extends Vehicle{
    
    Integer steeringRotation {private set{
        if(value >= -1440 || value <= 1440)
        {
            this.steeringRotation = value;            
        }
        else{
            this.steeringRotation = 0;
        }
    }}
    public Double tireRotation { get; private set{
        if(value >= -90 || value <= 90)
        {
            this.tireRotation = value;            
        }
        else{
            this.tireRotation = 5;
        }
    }}
    public Integer gear {public get{
        if(this.gear == null){
            return 0;
        } else{
            return this.gear;
        }
    } private set{
        this.gear = value;
    }}
    
    public Car(){
        super();
        super.media.add(medium.LAND);
        this.steeringRotation = 0;
        this.tireRotation = 0;
    }
    public Car(Integer c, Integer s, Integer o, String n){
        super(c, s, o, n);
        super.media.add(medium.LAND);
        this.steeringRotation = 0;
        this.tireRotation = 0;
    }    
    
   	public override void turn(Integer value){
        this.steeringRotation = value;
        this.tireRotation = ((Double) value/16);
    }
    
    public void accelerateCar(Integer value){
        super.accelerate(value);
        this.gear = (Integer)Math.ceil(0.4444 * (Math.sqrt(super.speed)));
    }
    
    
        
    
    
    
}