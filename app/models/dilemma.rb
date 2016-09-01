class Dilemma < ActiveRecord::Base
  has_attached_file :option1, :styles => { :large => "600x600", :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :option1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :option2, :styles => { :large => "600x600", :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :option2, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  has_many :votes,
            -> { extending WithUserAssociationExtension },
            dependent: :destroy
            #test comment
end
