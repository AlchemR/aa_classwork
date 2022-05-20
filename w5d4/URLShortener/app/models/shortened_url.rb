# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_link  :string           not null
#  short_link :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_link, :short_link, presence: true, uniqueness: true
  validates :user_id, presence: true 
  

  def self.random_code
    li = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(:short_link => li) #until ShortenedUrl.exists?(:short_link => li) == false
    li = SecureRandom.urlsafe_base64
    end    
    return li
  end

def self.create!(user, long_url)
    short_url = ShortenedUrl.random_code
    short = ShortenedUrl.new(long_link: long_url, short_link: short_url, user_id: user.id)
    short
end

belongs_to :submitter,
primary_key: :id,
foreign_key: :user_id,
class_name: :User

end
