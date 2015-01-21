require 'serverspec'
set :backend, :exec

describe '[HERO]' do

  it 'updates the apt cache' do
    expect(file '/var/cache/local/preseeding').to be_directory
  end

end
