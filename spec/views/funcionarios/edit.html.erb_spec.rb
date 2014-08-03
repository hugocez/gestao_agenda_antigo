require 'spec_helper'

describe "funcionarios/edit" do
  before(:each) do
    @funcionario = assign(:funcionario, stub_model(Funcionario,
      :nome => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit funcionario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", funcionario_path(@funcionario), "post" do
      assert_select "input#funcionario_nome[name=?]", "funcionario[nome]"
      assert_select "input#funcionario_user_id[name=?]", "funcionario[user_id]"
    end
  end
end
