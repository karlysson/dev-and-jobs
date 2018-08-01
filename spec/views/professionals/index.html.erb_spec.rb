require 'rails_helper'

RSpec.describe "professionals/index", type: :view do
  before(:each) do
    assign(:professionals, [
      Professional.create!(
        :name => "Name",
        :email => "Email",
        :language => "Language",
        :description => "Description",
        :professional_history => "Professional History",
        :key_words => "Key Words"
      ),
      Professional.create!(
        :name => "Name",
        :email => "Email",
        :language => "Language",
        :description => "Description",
        :professional_history => "Professional History",
        :key_words => "Key Words"
      )
    ])
  end

  it "renders a list of professionals" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Professional History".to_s, :count => 2
    assert_select "tr>td", :text => "Key Words".to_s, :count => 2
  end
end
