class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  has_many :schools
  has_many :favorites, dependent: :destroy
  has_many :favorite_schools, through: :favorites, source: :school
  validates :name, presence: true
  enum role: { general: 0, executive: 1 }

  def role_i18n
    I18n.t("enums.user.role.#{role}")
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー(管理者)"
      user.admin = "admin"
    end
  end

  def self.guest_executive
    find_or_create_by!(email: 'guest_executive@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー(経営者)"
      user.role = "executive"
    end
  end 

  def self.guest_general
    find_or_create_by!(email: 'guest_general@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー(一般ユーザー)"
      user.role = "general"
    end
  end
end
