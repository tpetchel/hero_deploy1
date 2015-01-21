require 'serverspec'
set :backend, :exec

describe '[HERO]' do

  it "is running Apache" do
    expect(package 'apache2').to be_installed
  end

end
