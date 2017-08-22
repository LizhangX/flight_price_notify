class Flight < ApplicationRecord
    has_many :prices

    validates :fport, :tport, :ddate, :rdate, presence: true
    validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
    validates_date :ddate, on_or_after: :today
    validates_date :rdate, on_or_after: :today

    before_save :downcase_email
    
    def downcase_email
        self.email.downcase!
    end
end
