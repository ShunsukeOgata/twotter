class Tweet < ActiveRecord::Base
  validates :content, 
  presence: { message: "文字を入力してください" },
  length: { maximum: 140, message: "140字以内で入力して下さい" }
end
