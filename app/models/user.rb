class User < ActiveRecord::Base
    validates :name, :username, :password_digest, :email, presence: true
    validates :username, length: {minimum: 2, maximum: 16, allow_nil: true}
    validates :password, length: { minimum: 6, allow_nil: true}

    has_attached_file :avatar, :styles => {
      :normal => "96x96>",
      :thumb => "48x48>"
    }, :default_url => '/assets/missing_:style.png'

    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    after_initialize :ensure_session_token

    attr_reader :password, :idInput

    has_many(
      :found_products,
      class_name: "Product",
      foreign_key: :finder_user_id,
      primary_key: :id
    )

    has_many :likes, class_name: "Like"
    has_many :liked_products, through: :likes, source: :product

    def self.find_by_credentials(idInput, password)
      #checks for username first. If unsuccessful, follows up with email
      @user = User.find_by_username(idInput)
      @user = User.find_by_email(idInput) if @user.nil?

      return nil if @user.nil?

      return @user if @user.valid_password?(password)
    end

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def valid_password?(password)
      BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def generate_session_token
      SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token
      self.session_token = generate_session_token
      self.save
      self.session_token
    end

    def ensure_session_token
      self.session_token ||= generate_session_token
    end

end
