# == Schema Information
#
# Table name: products
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_type_id :integer
#  properties      :text
#

class Product < ApplicationRecord
	belongs_to :product_type
	serialize :properties, Hash
	
	validate :validate_properties
	
	def validate_properties
		product_type.fields.each do |field|
			if field.required? && properties[field.name].blank?
				errors.add field.name, "must not be blank"
			end
		end
	end
end
