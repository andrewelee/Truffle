class User < ActiveRecord::Base
    validates :name, :username, :password_digest, :email, presence: true
    validates :username, length: {minimum: 2, maximum: 16, allow_nil: true}
    validates :password, length: { minimum: 6, allow_nil: true}

    after_initialize :ensure_session_token

    attr_reader :password, :idInput

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
