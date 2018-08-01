require 'rails_helper'

RSpec.describe "professionals/new", type: :view do
  before(:each) do
    assign(:professional, Professional.new(
      :name => "MyString",
      :email => "MyString",
      :language => "MyString",
      :description => "MyString",
      :professional_history => "MyString",
      :key_words => "MyString"
    ))
  end

  it "renders new professional form" do
    render

    assert_select "form[action=?][method=?]", professionals_path, "post" do

      assert_select "input#professional_name[name=?]", "professional[name]"

      assert_select "input#professional_email[name=?]", "professional[email]"

      assert_select "input#professional_language[name=?]", "professional[language]"

      assert_select "input#professional_description[name=?]", "professional[description]"

      assert_select "input#professional_professional_history[name=?]", "professional[professional_history]"

      assert_select "input#professional_key_words[name=?]", "professional[key_words]"
    end
  end
end
