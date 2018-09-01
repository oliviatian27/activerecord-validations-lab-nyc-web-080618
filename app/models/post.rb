class Post < ActiveRecord::Base
  validates :title,presence:true
  validates :content,length:{minimum:250}
  validates :summary,length:{maximum:250}
  validates :category,inclusion:{in:["Fiction","Non-Fiction"]}
  validate :clickbait

  def clickbait
    bait=["Won't Believe", "Secret", "Top [number]", "Guess"]
    if title&&!bait.any?{|x| title.include?(x)}
      errors.add(:title,"not sufficiently clickbait-y.")
      return false
    end
  end

end
