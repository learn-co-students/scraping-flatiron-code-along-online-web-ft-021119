require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def initialize
    @@all = []
  end

  def get_page
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    doc = Nokogiri::HTML(html)
  end

  def get_courses
    self.get_page.css("section#course-grid article")
    #binding.pry
  end

  def make_courses
    self.get_courses.map do |el|
      course = Course.new
      course.title = el.css("h2").text
      course.schedule = el.css("date").text
      course.description = el.css("p").text
      #binding.pry
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      binding.pry
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
