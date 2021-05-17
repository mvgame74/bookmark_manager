require 'bookmark'

describe Bookmark do
  describe 'display all bookmarks' do
    it 'shows all bookmarks' do
      bookmark = Bookmark.all
      p bookmark
      expect(bookmark).to include('gov.uk')
      expect(bookmark).to include('youtube.com')
      expect(bookmark).to include('facebook.com')
      expect(bookmark).to include('twitter.com')
    end
  end
end

