# Filter.Twitter.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#

os = require 'os'

Twits = () ->
	this["*"] = (_label, message) ->
		if (message.hasOwnProperty('delete'))
			return
		if (message.lang != 'en')
			return
		tags = ( tag.text for tag in  message.entities.hashtags)
		if (tags.length == 0 )
			return
		console.log(message.user.name, message.text, tags)
		this.send [ "tweet", tags, message.user.name, message.text ], this.dest, this.key

module.exports = Twits
