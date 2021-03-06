# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  nickname               :string
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  remaining_points       :integer          default(0)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :user_project_designations
  has_many :projects, through: :user_project_designations
  has_many :user_points
  has_many :redeemed_points

  validates :email, uniqueness: true
  accepts_nested_attributes_for :user_project_designations, :allow_destroy => true

  before_destroy :destroy_user_points

  def complete_name
    [first_name, last_name].join(' ')
  end

  def get_accumulated_individual_points
    accumulated = 0

    self.user_points.each do |points|
      if points.created_at.beginning_of_week == DateTime.current.beginning_of_week
        accumulated += points.score
      end
    end

    accumulated
  end

  def destroy_user_points
    user_points = UserPoint.where(project_id: self.id)
    if user_points.any?
      user_points.destroy_all
    end
  end

end
