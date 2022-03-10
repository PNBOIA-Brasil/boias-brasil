
# nokogiri requires open-uri
require 'nokogiri'
require 'open-uri'
# csv will be used to export data
require 'csv'

letters = ("a".."z").to_a

active_principles = []

letters.each do |letter|
  url = "https://consultaremedios.com.br/principios-ativos/#{letter}"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(".content-grid.content-grid--text-links a").each do |element|
    url = "https://consultaremedios.com.br#{element.attribute("href").value}"
    # puts element.text.strip
    # puts url
    active_principles << url
  end
end

medications = []

active_principles.first(2).each do |active_principle|
  html_file = URI.open(active_principle).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(".result-item__title a").each do |element|
    url = "https://consultaremedios.com.br#{element.attribute("href").value}"
    medications << url
    # puts element.attribute("href").value
  end
end
# puts medications[0]
puts "--> Até aqui deu certo :D"

medications.first(2).each do |medication|
  html_file = URI.open(medication).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(".new-product-header__top-side.new-product-header__top-side--quantity-ab-test").each do |element|
    Medication.create!(
                        active_substance = element.search(".new-product-header__top-side__top-middle-side__substance-wrapper").text.strip,
                        commercial_name = element.search(".new-product-header__top-side__top-middle-side__title-wrapper").first.text.strip.split(',')[0].split(/\s*\A\s*(\w+)\s*(\w+)/)[1],
                        concentration = element.search(".new-product-header__top-side__top-middle-side__title-wrapper").first.text.strip.split(',')[0].split(/\s*(\d+\w+)\D\w+/)[1],
                        lab = element.search(".new-product-header__topic.new-product-header__topic--factory .new-product-header__factory-wrapper__text b").text.strip
                        # imagem = element.search(".new-product-header__top-side__top-left-side img")
    )
  end
end


# require "csv"

filepath_capital = "db/data/unidades_capital.csv"

CSV.foreach(filepath_capital, quote_char: "\x00", headers: :first_row) do |row|
  pharmacy = Pharmacy.new(
    pharmacy_name: "#{row[0]}",
    pharmacy_address: "#{row[1]}, São Paulo"
  )
end
