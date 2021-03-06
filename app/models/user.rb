class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         # :omniauthable, omniauth_providers: [:facebook]
         #:lockable, :timeoutable

  has_many :surveys
  has_many :responses
end
