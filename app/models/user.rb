# coding: utf-8
class User < ApplicationRecord

  # 保存前にメールアドレスを強制的に小文字に変換
  before_save do
    self.email = email.downcase
  end

  # name のバリデーション
  validates :name ,
            presence: true,
            length: { maximum:  50 }

  # email のバリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true #{ case_sensitive: false }

  # ハッシュされたパスワードを持つという指示
  has_secure_password

  # password のバリデーション
  validates :password,
            presence: true,
            length: { minimum: 6 }
end
