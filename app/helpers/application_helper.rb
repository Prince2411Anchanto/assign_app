module ApplicationHelper
    def gravatar_for(user)
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=300"
        image_tag(gravatar_url, alt: user.username, class: "rounded mx-auto d-block shadow")
    end
end
