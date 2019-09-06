class Report < ActiveRecord::Base

  belongs_to :listing, optional: true
  belongs_to :user, optional: true
end
