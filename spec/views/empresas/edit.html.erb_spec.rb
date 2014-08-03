require 'spec_helper'

describe "empresas/edit" do
  before(:each) do
    @empresa = assign(:empresa, stub_model(Empresa,
      :razao_social => "MyString",
      :cnpj => 1
    ))
  end

  it "renders the edit empresa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", empresa_path(@empresa), "post" do
      assert_select "input#empresa_razao_social[name=?]", "empresa[razao_social]"
      assert_select "input#empresa_cnpj[name=?]", "empresa[cnpj]"
    end
  end
end
