require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_accessor :doc


  def initialize
    @doc = []
  end

  def get_page
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    @doc = Nokogiri::HTML(html)
    #binding.pry
  end

  def get_courses
    @doc.css("section#course-grid article")
  end

    # html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    # @doc = (Nokogiri::HTML(html)).css("section#course-grid article")
  end

  def make_courses
    @doc
    binding.pry
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
