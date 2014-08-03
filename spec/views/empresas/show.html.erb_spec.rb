require 'spec_helper'

describe "empresas/show" do
  before(:each) do
    @empresa = assign(:empresa, stub_model(Empresa,
      :razao_social => "Razao Social",
      :cnpj => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Razao Social/)
    rendered.should match(/1/)
  end
end
