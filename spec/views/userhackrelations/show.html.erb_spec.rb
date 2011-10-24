require 'spec_helper'

describe "userhackrelations/show.html.erb" do
  before(:each) do
    @userhackrelation = assign(:userhackrelation, stub_model(Userhackrelation,
      :user => nil,
      :hack => nil,
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Role/)
  end
end
