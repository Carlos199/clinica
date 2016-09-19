# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brand < ApplicationRecord
	include ActiveModel::Validations

	validates :name, presence: true, uniqueness: { case_sensitive: false }

	validates_with ValidateUnaccent, model: self
end
