require 'bookmarks'

describe Bookmarks do 
	it 'fetches bookmarks from datatbase'  do 
    	connection = PG.connect(dbname: 'bookmark_manager_test')

        # Add the test data
        connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
        connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    	bookmarks = Bookmarks.all
    	expect(bookmarks).to include "http://www.makersacademy.com"
        expect(bookmarks).to include "http://www.destroyallsoftware.com"
        expect(bookmarks).to include "http://www.google.com"
	end
end