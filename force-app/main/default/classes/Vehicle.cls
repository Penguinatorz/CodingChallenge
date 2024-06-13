public abstract class Vehicle {
    
    public Enum medium{
        LAND,
        AIR,
        WATER        
    }
    
    
    public Integer speed {get{
        if(this.speed >= 0){
            return this.speed;
        } else{
            return 0;
        }
    } private set{
        this.speed = value;
    }}
    
    public String name {get; private set;}
    
    public Integer occupants {get{
        if(this.occupants >= 0)
        {
            return this.occupants;
        } else{
            return 0;
        }
    } private set{
        this.occupants = value;
    }}
    
    protected List<medium> media = new List<medium>();
    
    public Vehicle(){
       final Integer capcity = 1;
       this.Speed = 1;
       this.occupants = 4;
        this.name = 'Speedster';        
    }
    public Vehicle(Integer c, Integer s, Integer o, String n){
       final Integer capcity = c;
       this.Speed = s;
       this.occupants = o;
       this.name = n;        
    }    
    
    public void accelerate(Integer value){
        this.Speed = value;
    }
    
    public abstract void Turn(Integer value);
    
    public String toStringVehicle(){
        String printsVehicleDetails = 'Current Speed: ' + this.speed + ' Media: ' + this.media + ' Name of Vehicle: ' + this.name + ' Number of Occupants: ' + this.occupants;
        return printsVehicleDetails;
    }
    
    

}