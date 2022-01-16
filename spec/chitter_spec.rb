require 'chitter'

describe Chitter do
    it "creates a new message" do
      new_chat = Chitter.create(message: "New test message", time: Time.now)
      expect(new_chat).to eq "New test message"
      expect(new_chat).not_to be_empty
    end

    it "shows all messages" do
        Chitter.create(message: "Initial chat")
        Chitter.create(message: "Testing 1, 2, 3")
        new_chat = Chitter.create(message: "Final message")
    
        all_chats = Chitter.all
    
        expect(all_chats.first).to be_a Chitter
        expect(all_chats.first.id).to eq new_chat.id
        expect(all_chats.first.message).to eq "Final message"
      end
end

