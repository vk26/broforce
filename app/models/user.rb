class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable,
    omniauth_providers: [:github]

  def self.from_github(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.email = auth.info.email
      user.name = auth.info.name
      user.image = auth.info.image
      user.nickname = auth.info.nickname
      user.github_url = auth.info.urls[:GitHub]
    end
  end
end
