class Post < ActiveRecord::Base
   has_many :comments
   
   attr_accessor :title, :body
   
   def initialize(title, body)
     @title, @body  = title, body
   end


end
