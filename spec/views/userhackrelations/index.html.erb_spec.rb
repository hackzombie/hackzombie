require 'spec_helper'

describe "userhackrelations/index.html.erb" do
  before(:each) do
    assign(:userhackrelations, [
      stub_model(Userhackrelation,
        :user => nil,
        :hack => nil,
        :role => "Role"
      ),
      stub_model(Userhackrelation,
        :user => nil,
        :hack => nil,
        :role => "Role"
      )
    ])
  end

  it "renders a list of userhackrelations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
