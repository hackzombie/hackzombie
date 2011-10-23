require 'spec_helper'

describe "hackplatformrelations/edit.html.erb" do
  before(:each) do
    @hackplatformrelation = assign(:hackplatformrelation, stub_model(Hackplatformrelation,
      :platform => nil,
      :hack => nil
    ))
  end

  it "renders the edit hackplatformrelation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hackplatformrelations_path(@hackplatformrelation), :method => "post" do
      assert_select "input#hackplatformrelation_platform", :name => "hackplatformrelation[platform]"
      assert_select "input#hackplatformrelation_hack", :name => "hackplatformrelation[hack]"
    end
  end
end
