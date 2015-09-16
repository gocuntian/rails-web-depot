class Product < ActiveRecord::Base
	# Title can't be blank, Description can't be blank, Image url can't be blank
	validates :title, :description, :image_url, :presence => true

	# Price must be greater than or equal to 0.01
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

	# Title has already been taken
	validates :title, :uniqueness => true

	# Image url must be a URL for GIF, JPG or PNG image.
	validates :image_url, allow_blank: true, format: {
													with:    %r{\.(gif|jpg|png)\Z}i,
													message: 'must be a URL for GIF, JPG or PNG image.'
											}
end
