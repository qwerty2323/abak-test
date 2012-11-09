require "spec_helper"

describe ApplicationHelper do

  it "should parse **bold** as <b>bold</b>" do
    content = '**bold text**'
    expect(helper.page_content_as_html content).eql? '<b>bold text</b>'
  end

  it "should parse \\\\italic\\\\ as <i>italic</i>" do
    content = "\\\\italic text\\\\"
    expect(helper.page_content_as_html content).eql? '<i>italic text</i>'
  end

  it "should only make bold what's between markers" do
    content = "**bold text**regular text"
    expect(helper.page_content_as_html content).eql? '<b>bold text</b>regular text'
  end

  it "should only make italic what's between markers" do
    content = "\\\\italic text\\\\regular text"
    expect(helper.page_content_as_html content).eql? '<b>italic</b>regular text'
  end

  it "should support bold italic links" do
    content = "((/page1 **\\\\bold italic link\\\\**))"
    expect(helper.page_content_as_html content).eql? '<a href="/page1/page2"><b><i>bold italic link</i></b></a>'
  end

end