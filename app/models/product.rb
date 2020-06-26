class Product < ApplicationRecord
	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item
	
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :title, uniqueness: true
	# allow_blank only allows the blank error to display if the field is blank
	validates :image_url, allow_blank: true, format: {
		with:    %r{\.(gif|jpg|jpeg|png)\Z}i,
		message: 'must be a URL for GIF, JPG, JPEG or PNG image.'
	}
	validates :title, length: { minimum: 10 }


	private
		# ensure that no line_item has reference to the product before destruction
		def ensure_not_referenced_by_any_line_item
			unless line_items.empty?
				errors.add(:base, 'Line Items present')
				throw :abort
			end
		end
end
