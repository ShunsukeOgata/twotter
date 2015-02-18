# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base

  belongs_to :user

  validates :content,
  presence: { message: "文字を入力してください" },
  length: { maximum: 140, message: "140字以内で入力して下さい" }

end
