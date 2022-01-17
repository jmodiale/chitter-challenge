feature 'View messages on chitter' do
    scenario 'visiting the chitter page' do
      visit('/')
      expect(page).to have_content "Test page"
    end
end

feature 'create new messages' do
    scenario "user can create a chat" do
      visit '/new'
      fill_in 'message', with: 'New test message'
      click_on 'Submit'
      expect(page).to have_content('New test message')
    end
end

feature "show all messages" do
    scenario "view the list of messages" do
      Chit.create(message: "first")
      Chit.create(message: "second")
      Chit.create(message: "last")

      visit '/posts'
  
      expect(page).to have_content("first")
      expect(page).to have_content("second")
      expect(page).to have_content("last")
    end
  end

