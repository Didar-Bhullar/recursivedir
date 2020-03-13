property :owner, [String, Integer]
property :group, [String, Integer]
property :mode, [String, Integer]

action :run do
  directory_list = new_resource.name.split('/')
  directory_list.shift if directory_list[0] == ''

  path = ''
  directory_list.each do |directory|
    path = path + '/' + directory

    directory path do
      owner new_resource.owner if property_is_set?(:owner)
      group new_resource.group if property_is_set?(:group)
      mode new_resource.mode if property_is_set?(:mode)
      action :create
    end
  end
end
