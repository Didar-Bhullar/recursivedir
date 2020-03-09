require 'spec_helper'

describe 'recursivedir::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on CentOS 7' do
    platform 'centos', '7'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
