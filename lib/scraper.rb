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
    @@doc = doc
  end

  def get_courses
    @@doc.css("section#course-grid article")
  end

  def make_courses
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    doc = Nokogiri::HTML(html)
    courses = @@doc.css("section#course-grid article").text.split("  Learn More  ")
    courses.each do |course|
      if course
        @@all << course
        @title = course.split("Full-Time")[0].strip
        @schedule = course.scan(/....(-Time)/)
        @description = course.split("Full-Time")[1].strip
      end
    end
  end

  def print_courses
    @title
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
