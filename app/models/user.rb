class User < ActiveRecord::Base    
  has_secure_password

  validates :username,      :presence => true,
                            :uniqueness => true,
                            :length => {:within => 6..20},
                            :format => { :with => /\A[A-Za-z0-9]+\z/,
                                :message => "Letters and numbers only." },
                            on: :create

  validates :email,         :presence => true,
                            :uniqueness => true

  validates :password,      :presence => true,
                            on: :create
  def ember_json
    Jbuilder.encode do |json|
      json.user do
        json.(self, :id, :username, :email)
      end
    end
  end
end
