feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'URL',   with: 'http://www.makersacademy.com/'
    fill_in 'Title', with: 'Makers Academy'
    fill_in 'Tags',  with: 'education'

    click_button 'Save bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

end
