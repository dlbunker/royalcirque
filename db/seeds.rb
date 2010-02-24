# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
ActiveRecord::Base.connection.execute("truncate table products")
ActiveRecord::Base.connection.execute("truncate table product_types")
ActiveRecord::Base.connection.execute("truncate table authors")


ProductType.create ( :name => 'Book')

Author.create ( 
  :first_name => 'Dan',
  :last_name => 'Bunker',
  :biography => 'Dan Bunker has been playing guitar for over 20 years. He spent 2 years playing and studying Jazz composition at the University of Utah. Classical study and performance have also been a large part of his repertoire for many years. Dan has spent 15 plus years private teaching and educating hundreds of guitar students in the Salt Lake City area.'
)

Product.create ( 
  :product_type_id => ProductType.first.id,
  :author_id => Author.first.id,
  :title => 'LDS Guitar Hymns',
  :sku => 'RCP-0310-LGH1',
  :description => 'These Hymns have been selected from the Church of Jesus Christ of Latter Day Saint Hymn Book.  Regardless of your playing ability you will be able to find a piece in this book that is appropriate to play at any setting.  Whether in Church or at home you will bring the familiar sounds of LDS Hymns to others through the warm sounds of the guitar.',
  :price => 17.95
)
