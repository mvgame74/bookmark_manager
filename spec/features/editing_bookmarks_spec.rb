# As a user
# So I can change a bookmark in Bookmark Manager
# I want to update a bookmark

feature 'updating a bookmark' do 
  scenario 'a user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.reddit.com', title: 'Reddit')
    visit ('/bookmarks')
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com' )

    first('.bookmark').click_button('Edit')
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/edit")

    fill_in('url', with: 'http://www.spotify.com')
    fill_in('title', with: 'Spotify')
    click_button('Submit')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('Reddit', href: 'http://www.reddit.com')
    expect(page).to have_link('Spotify', href: 'http://www.spotify.com')
  end 
end 