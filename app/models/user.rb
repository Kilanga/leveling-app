class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_many :quests, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_one :class_progression
  validates :level, :xp, :coins, :quests_completed, presence: true, numericality: { greater_than_or_equal_to: 0 }
  before_create :set_defaults

  def set_defaults
    self.level ||= 1
    self.xp ||= 0
    self.coins ||= 0
    self.quests_completed ||= 0
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end
end
