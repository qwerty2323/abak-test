require "spec_helper"

describe WikiController do

  it "GET #add" do
    get :add, :path => '/some/page'
    expect(assigns(:page)).to be_a_new Page
    expect(assigns(:parent)).to be_a_new Page
  end

  it "should allow creating a wiki page" do
    get :create, :page => :page
    #To change this template use File | Settings | File Templates.
    true.should == false
  end
end