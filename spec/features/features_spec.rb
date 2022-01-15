feature 'View messages on chitter' do
    scenario 'visiting the chitter page' do
      visit('/')
      expect(page).to have_content "Test page"
    end
end

