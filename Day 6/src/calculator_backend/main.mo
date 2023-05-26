import Int "mo:base/Int";
import Float "mo:base/Float";


// import Math "mo:base/Math";

actor Calculator {
    
    // Step 2 - Implement add
    public func add( num1 : Float, num2: Float) : async Float {
        let result = num1 + num2 ;
         return result;
    };
    
    // Step 3 - Implement sub 
    public func sub(num1 : Float, num2: Float) : async Float {
        let result = num1 - num2 ;
        return result;
    };
    
    // Step 4 - Implement mul 
    public func mul(num1 : Float, num2: Float) : async Float {
        let result = num1 * num2 ;
        return result;
    };
    
    // Step 5 - Implement div 
    public func div(num1 : Float, num2: Float) : async ?Float {
      
      if( num2 == 0.0){
        return null;
      }else {
        let result = num1 / num2 ;

        return ?result;
      }
    };
    
    // Step 8 - Implement power 
    public func power(num1 : Float, num2: Float) : async Float {
      let result= Float.pow(num1, num2);
        return result;
    };
    
    // Step 9 - Implement sqrt 
    public func sqrt(num1 : Float) : async Float {
        let result = Float.sqrt(num1);
        return result;
    };
    
    // Step 10 - Implement floor 
    public func floor(num1 : Float) : async Int {
      
      let result = Float.floor(num1) ; // return integer value <= counter but the type is still float
      return Float.toInt(result); // this just return integer part without decimals . here type is interger
        
    };

    public func factorial(num1: Float): async Float {
      var result: Float = 1.0;
      var i: Float = 2.0;

      while (i <= num1 ){
        result *= i;
        i += 1.0;
      };
      return result;
    };

    // Returns the sine of the degree angle `x`.
    public func sin(num1 : Float) : async Float {
        let result = Float.sin(num1 * (Float.pi/180));
        return result;
    };
    public func cos(num1 : Float) : async Float {
        let result = Float.cos(num1 * (Float.pi/180));
        return result;
    };
    public func tan(num1 : Float) : async Float {
        let result = Float.tan(num1 * (Float.pi/180));
        return result;
    };

    public func log(num1 : Float) : async Float {
        let result = Float.log(num1);
        return result;
    };

    public func exp(num1 : Float) : async Float {
        let result = Float.exp(num1);
        return result;
    };

    public func remainder(num1 : Float, num2: Float) : async Float {
      let result= Float.rem(num1, num2);
        return result;
    };    
};