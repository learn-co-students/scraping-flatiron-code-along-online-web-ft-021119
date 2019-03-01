class Course
@@all = []
attr_accessor :title, :schedule, :description
# attr_reader :title
# attr_writer :title
# title

  def initialize
    @@all << self
  end


  def self.all
    @@all
  end

  def self.reset_all
  #@@all =[]
  @@all.clear
  end
end
