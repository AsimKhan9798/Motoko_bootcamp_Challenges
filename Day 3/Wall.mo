// import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Blob "mo:base/Blob";
import Principal "mo:base/Principal";
import Int "mo:base/Int";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";

module Wall {

  public type Content = {
    #Text : Text;
    #Image : Blob;
    #Video : Blob;
  };

  public type Message = {
    vote : Int;
    content : Content;
    creator : Principal;
  };

  public func create_message(content : Content, creator : Principal) : Message {
    var message : Message = {
      vote = 0;
      content = content;
      creator = creator;
    };
    return message;
  };

  public func add_message_to_wall(wall : HashMap.HashMap<Nat, Message>, message : Message, previousId : Nat) : Nat {
    let nextId : Nat = previousId + 1;
    wall.put(nextId, message);
    return nextId;
  };

  public func update_message(message : Message, content : Content) : Message {

    let updatedMessage : Message = {
      vote = message.vote;
      content = content;
      creator = message.creator;
    };
    return updatedMessage;
  };

  public func upvote_message(message : Message) : Message {

    let updatedMessage : Message = {
      vote = message.vote +1;
      content = message.content;
      creator = message.creator;
    };
    return updatedMessage;

  };

  public func downvote_message(message : Message) : Message {
    //Subtract -1 from the vote and check if less than 1 then assign to 0
    var newVote : Int = message.vote -1;

    if (newVote < 0) {
      newVote := 0;
    };
    //Prepare the data with the new vote
    let updatedMessage : Message = {
      vote = newVote;
      content = message.content;
      creator = message.creator;
    };
    return updatedMessage
  };

};
