# == Schema Information
#
# Table name: product_fields
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  field_type      :string
#  required        :boolean
#  product_type_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ProductField < ApplicationRecord
  belongs_to :product_type
end
