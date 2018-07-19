require "google_drive"
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

class Scrapper

  attr_accessor :hash

  def initialize
    @hash = Hash[get_the_city_name.zip(get_all_mail)]
  end

  def get_the_city_name
    lien_dep = ['http://www.annuaire-des-mairies.com/morbihan.html','http://www.annuaire-des-mairies.com/lot-et-garonne.html','http://www.annuaire-des-mairies.com/hautes-alpes.html']
    nom_ville = []
    begin
    lien_dep.each do |lien|
      page = Nokogiri::HTML(open(lien))
      page.xpath('//p/a').each do |ville|
        nom_ville << ville.text
        end
    end
  rescue OpenURI::HTTPError => e
    puts 'RESCUE'
  end
    p nom_ville
  end

  def get_all_url
    lien_dep = ['http://www.annuaire-des-mairies.com/morbihan.html','http://www.annuaire-des-mairies.com/lot-et-garonne.html','http://www.annuaire-des-mairies.com/hautes-alpes.html']
    tab_url = []
    begin
      lien_dep.each do |lien|
      page = Nokogiri::HTML(open(lien))
      lien = page.css('//p/a').select{ |link| link['class'] == "lientxt" }

        lien.each do |link|
          tab_url << link['href'].sub(".", "http://annuaire-des-mairies.com")
        end
      end
    rescue OpenURI::HTTPError => e
      puts 'RESCUE'
    end
    p tab_url
  end

  def get_all_mail
    tab_mail = []
    lien_dep = ['http://www.annuaire-des-mairies.com/morbihan.html','http://www.annuaire-des-mairies.com/lot-et-garonne.html','http://www.annuaire-des-mairies.com/hautes-alpes.html']
    lien_dep.each do |lien|
      get_all_url.each do |url|
        mail = Nokogiri::HTML(open(url))
        tab_mail << mail.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
      end
    end
    p tab_mail
  end

  def to_csv
    CSV.open("../../db/townhalls.csv", "wb") {|csv| hash.to_a.each {|elem| csv << elem} }
  end

end

Scrapper.new.to_csv
