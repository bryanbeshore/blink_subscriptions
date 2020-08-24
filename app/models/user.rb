class User < ApplicationRecord
  has_person_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :memberships
  has_many :accounts, through: :memberships

  def owned_accounts
    Account.where(owner: self)
  end

  def all_accounts
    owned_accounts + accounts
  end
end
