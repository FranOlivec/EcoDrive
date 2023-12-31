class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :rentals, dependent: :destroy
         has_many :comments, dependent: :destroy

         validates :email, presence: true, uniqueness: true

         enum role: { client: 0, admin: 1 }

         after_initialize do
          if self.new_record?
            self.role ||= :client
          end
        end

end
