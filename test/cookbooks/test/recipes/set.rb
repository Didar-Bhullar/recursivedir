recursivedir_set '/tmp/dir1/dir2/dir3' do
  owner 'root'
  group 'root'
  mode '0750'
end

recursivedir_set 'dir4/dir5' do
  mode '0500'
end
