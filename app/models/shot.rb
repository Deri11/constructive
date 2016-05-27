class Shot < ActiveRecord::Base
belongs_to :user
has_many :comments

  def self.search(query)
    where("description LIKE ?", ''"%#{query}%"'')
  end

end
