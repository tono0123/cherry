class User < ActiveRecord::Base

	# validation
	validates :company, presence: true
	validates :sei, presence: true, length: { maximum: 50 }
	validates :mei, presence: true, length: { maximum: 50 }
	validates :postal_code, format: { with: /¥d/, message: "半角数字のみ入力できます"}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :tel, presence: true, numericality: {only_integer: true} #, format: { with: /¥d/ }

end
