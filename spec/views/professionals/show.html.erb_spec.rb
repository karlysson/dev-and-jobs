require 'rails_helper'

RSpec.describe "professionals/show", type: :view do
  before(:each) do
    @professional = assign(:professional, Professional.create!(
      :name => "Name",
      :email => "Email",
      :language => "Language",
      :description => "Description",
      :professional_history => "Professional History",
      :key_words => "Key Words"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Language/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Professional History/)
    expect(rendered).to match(/Key Words/)
  end
end
