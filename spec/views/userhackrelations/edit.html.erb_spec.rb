require 'spec_helper'

describe "userhackrelations/edit.html.erb" do
  before(:each) do
    @userhackrelation = assign(:userhackrelation, stub_model(Userhackrelation,
      :user => nil,
      :hack => nil,
      :role => "MyString"
    ))
  end

  it "renders the edit userhackrelation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => userhackrelations_path(@userhackrelation), :method => "post" do
      assert_select "input#userhackrelation_user", :name => "userhackrelation[user]"
      assert_select "input#userhackrelation_hack", :name => "userhackrelation[hack]"
      assert_select "input#userhackrelation_role", :name => "userhackrelation[role]"
    end
  end
end
