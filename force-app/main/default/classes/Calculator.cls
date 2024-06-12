public with sharing class Calculator {
    public Calculator() {

    }

    public Integer add (Integer int1, Integer int2){
        Integer int3 = int1 + int2;
        return int3;
        
    }
    
    public Integer multiply(Integer int1, Integer int2){
        
        Integer int3;
        
        for (Integer i=0; i<int2; i++){
            int3 =+ add(int1,int1);
        }
        return int3;
    }
    
    Public Integer divide(Integer int1, Integer int2){
        Integer int3 = 0;
        
        if(int2 != 0) {
            
            while(int1 >= int2){
                int1 -= int2;
                int3 =+ add(int3,1);
            }
            

        }else{
            int3 = 0;
        }
        
        return int3;
    }
        
   
    Public Integer mod(Integer int1, Integer int2){
        Double int3 = 0;
        int3 = int1/ (Decimal) int2;
        
        while(int3 > 1){
            int3 = int3 - 1;
        }
        int3 = int3 * 10;
        
        Integer int4 = (Integer) int3;
        
        
        return int4;
    }

    
        
        
}