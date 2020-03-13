require 'spec_helper'

describe 'recursivedir_set' do
  step_into :recursivedir_set
  platforms = %w(ubuntu mac_os_x)

  platforms.each do |platform|
    platform platform
    context 'with owner, group, and mode' do
      recipe do
        recursivedir_set '/tmp/dir1/dir2/dir3' do
          owner 'root'
          group 'root'
          mode '0700'
        end
      end

      it { is_expected.to create_directory('/tmp').with(owner: 'root', group: 'root', mode: '0700') }
      it { is_expected.to create_directory('/tmp/dir1').with(owner: 'root', group: 'root', mode: '0700') }
      it { is_expected.to create_directory('/tmp/dir1/dir2').with(owner: 'root', group: 'root', mode: '0700') }
      it { is_expected.to create_directory('/tmp/dir1/dir2/dir3').with(owner: 'root', group: 'root', mode: '0700') }
    end

    context 'with mode only' do
      recipe do
        recursivedir_set 'dir4/dir5' do
          mode '0500'
        end
      end

      it { is_expected.to create_directory('/dir4').with(mode: '0500') }
      it { is_expected.to create_directory('/dir4/dir5').with(mode: '0500') }
    end
  end
end
