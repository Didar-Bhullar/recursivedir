control 'directory_setups' do
  describe directory('/tmp') do
    it { should be_directory }
    its('owner') { should cmp 'root' }
    its('group') { should cmp 'root' }
    its('mode') { should cmp '0750' }
  end

  describe directory('/tmp/dir1') do
    it { should be_directory }
    its('owner') { should cmp 'root' }
    its('group') { should cmp 'root' }
    its('mode') { should cmp '0750' }
  end

  describe directory('/tmp/dir1/dir2') do
    it { should be_directory }
    its('owner') { should cmp 'root' }
    its('group') { should cmp 'root' }
    its('mode') { should cmp '0750' }
  end

  describe directory('/tmp/dir1/dir2/dir3') do
    it { should be_directory }
    its('owner') { should cmp 'root' }
    its('group') { should cmp 'root' }
    its('mode') { should cmp '0750' }
  end

  describe directory('/dir4') do
    it { should be_directory }
    its('mode') { should cmp '0500' }
  end

  describe directory('/dir4/dir5') do
    it { should be_directory }
    its('mode') { should cmp '0500' }
  end
end
