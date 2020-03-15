# recursivedir
[![Build Status](https://travis-ci.com/Didar-Bhullar/recursivedir.svg?branch=master)](https://travis-ci.com/Didar-Bhullar/recursivedir) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)


This cookbook provides a resource for recurisvely creating directories where each directory gets the specified mode, owner, and group instead of just the last leaf. This resource is a wrapper around the `directory` resource.

## Chef
* Chef 14.0+

## Platforms
The following platforms and versions are tested and supported using test-kitchen

* Ubuntu 16.04 / 18.04
* Debian 8/9
* CentOS 7+
* Fedora Latest
* OpenSUSE Leap
* RHEL

## Resources
This cookbook provides the `recusrivedir_set` resource. To use just add the <br> 
following line to your metadata file: <br>
`depends 'recursivedir'`<br>
```
# example 1
recursivedir_set '/tmp/dir1/dir2/dir3' do
  owner 'root'
  group 'root'
  mode '0750'
end

# example 2
recursivedir_set 'dir4/dir5' do
  mode '0500'
end
```
## Properties
These three properties are the exact same properties from the `directory` resource. <br>
Directory documentation link [here](https://docs.chef.io/resources/directory/).
| Property  | Type | Description |
| ------------- | ------------- | ----------- |
| owner  | String, Integer  | A string or ID that identifies the group owner by user name, including fully qualified user names such as domain\user or user@domain. If this value is not specified, existing owners remain unchanged and new owner assignments use the current user (when necessary). |
| group  | String, Integer  | A string or ID that identifies the group owner by group name, including fully qualified group names such as domain\group or group@domain. If this value is not specified, existing groups remain unchanged and new group assignments use the default POSIX group (if available). |
| mode  | String, Integer  | A quoted 3-5 character string that defines the octal mode that is passed to chmod. For example: '755', '0755', or 00755. If the value is specified as a quoted string, it works exactly as if the chmod command was passed. If the value is specified as an integer, prepend a zero (0) to the value to ensure that it is interpreted as an octal number. For example, to assign read, write, and execute rights for all users, use '0777' or '777'; for the same rights, plus the sticky bit, use 01777 or '1777' |