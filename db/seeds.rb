# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i1 = Image.create(url: "http://www.stoplight5k.com/uploads/3/5/5/2/3552919/1894554664_orig.jpg", reviewed: false)
Image.create(url: "http://farm4.static.flickr.com/3146/2745944013_9919cd7b30.jpg", reviewed: false)
i3 = Image.create(url: "http://upload.wikimedia.org/wikipedia/commons/0/0c/Stoplight.jpg", reviewed: false)
Image.create(url: "http://s3.freefoto.com/images/41/13/41_13_1_web.jpg", reviewed: false)
Image.create(url: "http://upload.wikimedia.org/wikipedia/commons/2/29/Stop_Light_at_Towanda_Avenue_and_College_Avenue_in_Normal_Illinois.JPG", reviewed: false)

ImageTag.create(image: i1, name: "tag1", value: "I'm here")
ImageTag.create(image: i1, name: "tag2", value: "I'm here, too")

ImageTag.create(image: i3, name: "tag3", value: "I'm here, aussi")


s1 = Selection.create(image: i1, start_x: 0, start_y: 0, end_x: 100, end_y: 100)
type1 = Type.create(name: "stoplight")
tag1 = type1.tags.build(value: "green")
tag1.selection = s1
tag1.save

