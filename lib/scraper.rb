require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
# get_page will use Nokogiri and open-uri to grab the entire HTML document from the web page
  def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

      # doc.css(".post").each do |post|
      #   course = Course.new
      #   course.title = post.css("h2").text
      #   course.schedule = post.css(".date").text
      #   course.description = post.css("p").text
      #   binding.pry
      # end
  end

  # get_courses will use a CSS selector to grab all of the HTML elements that contain a course
  def get_courses
    self.get_page.css(".post")
  end

# make_courses will instantiate Course objects and giving each course object the correct title, schedule and description attribute that we scraped from the page
  def make_courses
    # Course Title: doc.css(".post").first.css("h2").text
    # Schedule: doc.css(".post").first.css(".date").text
    # Description: doc.css(".post").first.css("p").text
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end

# print_courses calls on .make_courses and then iterates over all of the courses that gets created to puts out a list of course offerings
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

Scraper.new.get_page
Scraper.new.print_courses
