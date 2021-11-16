class User<ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true
  has_secure_password

   before_create :generate_key
  def generate_key
    self.api_key = SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
