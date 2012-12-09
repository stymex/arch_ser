xml.instruct! :xml, :version=>"1.0" 

xml.tag!("rows") do
    @users.each do |user|
        xml.tag!("row",{ "id" => user.id }) do
            xml.tag!("cell", user.uid)
            xml.tag!("cell", user.nickname)
            xml.tag!("cell", user.email)
            xml.tag!("cell", user.admin)
        end
    end
end