class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy # destroys cart with its line_items collection
end
