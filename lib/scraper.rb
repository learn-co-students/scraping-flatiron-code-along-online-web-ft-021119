require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

#doc.css(".post").first.css("h2").text
###"Web Development Immersive"
#doc.css(".post").first.css(".date").text
###"Full-Time"
#doc.css(".post").first.css("p").text
###"An intensive, Ruby and Javascript course that teaches the skills necessary to start a career as a full-stack software developer."

=begin
We did it! We have the working code for grabbing:

The page itself:
doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
The collection of course offerings:
doc.css(".post")
The title of an individual course offering:
doc.css(".post").first.css("h2").text
The schedule of an individual course offering:
doc.css(".post").first.css(".date").text
The description of an individual course offering:
doc.css(".post").first.css("p").text

=end

class Scraper

  def get_page

    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    # doc.css(".post").each do |post|
    #   course = Course.new
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text
    #   course.description = post.css("p").text
    #end
  end
  #binding.pry

  def get_courses
  self.get_page.css(".post")
end

  def make_courses
    self.get_courses.each do |post|
    course = Course.new
    course.title = post.css("h2").text
    course.schedule = post.css(".date").text
    course.description = post.css("p").text
    end
  end

    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end




end
