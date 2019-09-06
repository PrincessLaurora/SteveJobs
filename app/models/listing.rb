class Listing < ActiveRecord::Base

  belongs_to :category, optional: true
  belongs_to :user, optional: true
  has_many :responses
  has_many :reports

  validates_presence_of :title, :company, :location, :employment_type, :description, :requirements, :retribution, :category_title


  def category_title=(title)
     self.category = Category.find_or_create_by(title: title)
  end

   def category_title
      self.category ? self.category.title : nil
    end

end
