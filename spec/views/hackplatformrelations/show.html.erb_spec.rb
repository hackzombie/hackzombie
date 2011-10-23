require 'spec_helper'

describe "hackplatformrelations/show.html.erb" do
  before(:each) do
    @hackplatformrelation = assign(:hackplatformrelation, stub_model(Hackplatformrelation,
      :platform => nil,
      :hack => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
