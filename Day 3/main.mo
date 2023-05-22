import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Blob "mo:base/Blob";
import Principal "mo:base/Principal";
import Int "mo:base/Int";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Wall "Wall";
import Result "mo:base/Result";
import Iter "mo:base/Iter";

actor main {
  public type Content = Wall.Content;
  public type Message = Wall.Message;

  var messageId : Nat = 0;
  var wall = HashMap.HashMap<Nat, Message>(1, Nat.equal, Hash.hash);

  public shared ({ caller }) func writeMessage(content : Content) : async Nat {

    let message : Message = Wall.create_message(content, caller);
    messageId := Wall.add_message_to_wall(wall, message, messageId);
    return messageId;

  };

  public query func get_message(messageId : Nat) : async Result.Result<Message, Text> {
    let message : ?Message = wall.get(messageId);

    switch (message) {
      case (null) { return #err("Invalid ID!") };
      case (?record) { return #ok(record) };
    };
  };

  public shared ({ caller }) func update_message(messageId : Nat, c : Content) : async Result.Result<(), Text> {
    //Get hold of the message using ID
    let message : ?Message = wall.get(messageId);

    switch (message) {
      case (null) { return #err("Invalid ID!") };
      case (?record) {
        if (Principal.notEqual(caller, record.creator)) {
          return #err("Only the creator of message can update it.");
        };
        //Now we use the .put to update or pass the messageId as ID and the update_message function as the 2nd argument which adds the updated record and in the last we return Ok
        wall.put(messageId, Wall.update_message(record, c));
        return #ok();
      };
    };
  };

  public shared ({ caller }) func deleteMessage(messageId : Nat) : async Result.Result<(), Text> {
    //Get hold of message by ID, Then remove the message by .remove()
    let message : ?Message = wall.remove(messageId);
    //Result depending on the messageId
    switch (message) {
      case (null) { #err("Invalid ID!") };
      case (?record) { #ok() };
    };
  };

  public shared ({ caller }) func upVote(messageId : Nat) : async Result.Result<(), Text> {
    //Remove the current message from the wall;
    let message : ?Message = wall.remove(messageId);

    switch (message) {
      case (null) { return #err("Invalid Id!") };
      case (?record) {
        let updatedMessage = Wall.upvote_message(record);
        wall.put(messageId, updatedMessage);
        #ok();
      };
    };
  };

  public query func get_all_messages() : async [Message] {
    Iter.toArray<(Message)>(wall.vals());
  };
};
