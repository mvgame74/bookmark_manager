feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
  scenario '/Bookmarks pages shows bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "gov.uk"
    expect(page).to have_content "twitter.com"
    expect(page).to have_content "facebook.com"
    expect(page).to have_content "youtube.com"
  end
end
