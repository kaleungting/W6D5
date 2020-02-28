# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = ["zebra", "red", "rainbow", "blonde", "azul"]
  validates :birth_date, :name, :description, presence: true
  validates :sex, inclusion: { in: ["M", "F"] }, presence: true
  validates :color, inclusion: { in: COLORS}, presence: true


  def age
    time_ago_in_words(birth_date)
  end

end
