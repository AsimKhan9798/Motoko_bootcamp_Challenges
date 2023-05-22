import Bool "mo:base/Bool";
import Time "mo:base/Time";
import Int "mo:base/Int";
import Option "mo:base/Option";
import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Debug "mo:base/Debug";

actor HomeWorkDiary {

  public type Time = Time.Time;
  public type Homework = {
    title : Text;
    description : Text;
    dueDate : Time;
    completed : Bool;
  };

  var homeworkDiary = Buffer.Buffer<Homework>(0);

  // Add a new homework task
  public func addHomework(homework : Homework) : async Nat {
    //Add the homework object to the homeWorkDiary buffer.
    homeworkDiary.add(homework);
    //It returns one less than the size of the homeWorkDiary array
    return homeworkDiary.size() - 1;
  };

  // get homework by ID
  public query func getHomework(id : Nat) : async Result.Result<Homework, Text> {
    let result : ?Homework = homeworkDiary.getOpt(id);

    switch (result) {
      case (null) { #err("Invalid index.") };
      case (?record) { #ok(record) };
    };
  };

  //delete homework by ID
  public func deleteHomework(id : Nat) : async Result.Result<(), Text> {
    let result : ?Homework = homeworkDiary.getOpt(id);
    switch (result) {
      case (null) { #err("Invalid Index") };
      case (result) {
        let x = homeworkDiary.remove(id);
        #ok();
      };
    };
  };
  public query func getAllHomework() : async [Homework] {
    return Buffer.toArray<Homework>(homeworkDiary);
  };

};