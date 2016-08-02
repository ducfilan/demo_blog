module UsersHelper

	def gravartar_for(user)
		gravartar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravartar_id}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
end
