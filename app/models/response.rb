class Response < ActiveRecord::Base

  belongs_to :user, optional: true
  belongs_to :listing
end
