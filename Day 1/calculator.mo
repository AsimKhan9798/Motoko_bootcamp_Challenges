import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Char "mo:base/Char";

actor {

  //  Challenge 1
  public func add(x : Nat, y : Nat) : async Nat {
    return (x + y);
  };

  //  Challenge 2
  public func square(n : Nat) : async Nat {
    return (n * n);
  };

  //  Challenge 3
  public func days_to_second(n : Nat) : async Nat {
    return (n * 24 * 60 * 60);
    // Each day has 24 hours; each hour has 60 minutes; each minute has 60 seconds.
  };

  //  Challenge 4
  var counter = 0;

  public func increment_counter(n : Nat) : async Nat {
    counter += n;
    return counter;
  };

//  Challenge 5
  public func clear_counter() : async Nat {
    counter := 0;
    return counter;
  };

  //  Challenge 6
  public func divise(x : Nat, y : Nat) : async Bool {
    if (x % y == 0) {
      return true;
    } else {
      return false;
    };
  };

  //  Challenge 7 
  public func divise2(x : Nat, y : Nat) : async Bool {
    return (x % y == 0);
  };

  //  Challenge 8
  public func is_even(n : Nat) : async Bool {
    (n % 2 == 0);
  };

  //  Challenge 9
  public func sum_of_array(array : [Nat]) : async Nat {
    var sum = 0;
    for (val in array.vals()) {
      sum += val;
    };
    return (sum);
  };

  //  Challenge 10
  public func maximum(array : [Nat]) : async Nat {
    if (array.size() == 0) return 0;
    var maximum = array[0];
    for (val in array.vals()) {
      if (val >= maximum) {
        maximum := val;
      };
    };
    return (maximum);
  };

};
