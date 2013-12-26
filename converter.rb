require "nokogiri"
require "csv"

doc = Nokogiri::XML(open("./address.xml"))

contacts = doc.css("ContactXMLItem").map do |contact|
  full_name = contact.css("FullName").text
  zip_code = contact.css("AddressCode").text
  address = contact.css("FullAddress").text
  [zip_code, address, full_name]
end

CSV.open("address.csv", 'w') do |writer|
  contacts.each do |contact|
    writer << contact
  end
end
