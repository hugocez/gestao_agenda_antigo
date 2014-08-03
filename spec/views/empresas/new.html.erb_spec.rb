require 'spec_helper'

describe "empresas/new" do
  before(:each) do
    assign(:empresa, stub_model(Empresa,
      :razao_social => "MyString",
      :cnpj => 1
    ).as_new_record)
  end

  it "renders new empresa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", empresas_path, "post" do
      assert_select "input#empresa_razao_social[name=?]", "empresa[razao_social]"
      assert_select "input#empresa_cnpj[name=?]", "empresa[cnpj]"
    end
  end
end
