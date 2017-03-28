require_relative "./app/content"
require 'prawn'

def create

  read_settings_file
  create_pdf

end

def create_pdf
  Prawn::Document.generate("#{File.dirname(__FILE__)}/contract.pdf", :page_size => 'A4', :margin => [36,36,60,36]) do
    content
  end
end

def read_settings_file
  $data = {}
  num = [:town, :time, :buyer_name, :seller_name, :enterprise_name, :image]
  File.open("#{File.dirname(__FILE__)}/config.txt") do |f|
    f.each_with_index do |line, count|
      $data[num[count]] = line
      count+=1
    end
  end
end


 create
