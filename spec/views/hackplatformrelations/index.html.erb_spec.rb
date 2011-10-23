require 'spec_helper'

describe "hackplatformrelations/index.html.erb" do
  before(:each) do
    assign(:hackplatformrelations, [
      stub_model(Hackplatformrelation,
        :platform => nil,
        :hack => nil
      ),
      stub_model(Hackplatformrelation,
        :platform => nil,
        :hack => nil
      )
    ])
  end

  it "renders a list of hackplatformrelations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
