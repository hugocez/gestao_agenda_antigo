require 'spec_helper'

describe "empresas/index" do
  before(:each) do
    assign(:empresas, [
      stub_model(Empresa,
        :razao_social => "Razao Social",
        :cnpj => 1
      ),
      stub_model(Empresa,
        :razao_social => "Razao Social",
        :cnpj => 1
      )
    ])
  end

  it "renders a list of empresas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Razao Social".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
