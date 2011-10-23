require 'spec_helper'

describe "hackplatformrelations/new.html.erb" do
  before(:each) do
    assign(:hackplatformrelation, stub_model(Hackplatformrelation,
      :platform => nil,
      :hack => nil
    ).as_new_record)
  end

  it "renders new hackplatformrelation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hackplatformrelations_path, :method => "post" do
      assert_select "input#hackplatformrelation_platform", :name => "hackplatformrelation[platform]"
      assert_select "input#hackplatformrelation_hack", :name => "hackplatformrelation[hack]"
    end
  end
end
