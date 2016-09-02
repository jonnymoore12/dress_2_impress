class Dilemma < ActiveRecord::Base
  has_attached_file :option1, :styles => { :large => "600x600", :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  crop_attached_file :option1, :aspect => "4:5"
  validates_attachment_content_type :option1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :option2, :styles => { :large => "600x600", :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  crop_attached_file :option2, :aspect => "4:5"
  validates_attachment_content_type :option2, :content_type => /\Aimage\/.*\Z/

  # validates_presence_of :option1, :option2

  belongs_to :user

  has_many :votes,
            -> { extending WithUserAssociationExtension },
            dependent: :destroy
            #test comment
end
