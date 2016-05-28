class Shot < ActiveRecord::Base
belongs_to :user
has_many :comments

  def self.search(query)
    where("title LIKE ? OR description LIKE ?", ''"%#{query}%"'', ''"%#{query}%"'')
  end

end
