require "spec_helper"

describe Page do

  it "should create hierarchies for non-existent paths" do
    p = Page.find_or_create_by_path(['page1', 'page2', 'page3'], {:title => 'title', :slug => 'slug'})

    p.save

    puts p.inspect, p.parent.inspect
  end

end