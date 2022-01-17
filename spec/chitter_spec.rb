require 'chit'

describe Chit do
    it "creates a new message" do
      new_chat = Chit.create(message: "New test message")
      expect(new_chat).not_to be_nil
    end

    it "shows all messages" do
        Chit.create(message: "Initial chat")
        Chit.create(message: "Testing 1, 2, 3")
        new_chat = Chit.create(message: "Final message")
    
        all_chats = Chit.all
    
        expect(all_chats.first).to be_a Chit
        expect(all_chats.first.message).to eq "Initial chat"
      end
end

