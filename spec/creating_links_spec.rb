feature 'creating links' do
  scenario  'allow user to add new links' do
    visit 'links/new'
    fill_in 'URL', with: 'www.bbc.co.uk'
    fill_in 'Title', with: 'BBC'
    click_button('Save bookmark')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content 'Title: BBC URL: www.bbc.co.uk'
    end
  end
end
