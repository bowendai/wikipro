# acl.auth.php
# <?php exit()?>
# Don't modify the lines above
#
# Access Control Lists
#
# Editing this file by hand shouldn't be necessary. Use the ACL
# Manager interface instead.
#
# If your auth backend allows special char like spaces in groups
# or user names you need to urlencode them (only chars <128, leave
# UTF-8 multibyte chars as is)
#
# none   0
# read   1
# edit   2
# create 4
# upload 8
# delete 16

*               @ALL        8
*	@admin	255                   //为admin用户组分配全部权限。255这个权限值是专为admin用户组准备。
*	@user	8                     //为user用户组分配上传以下的权限。
*	@ALL	1                     //为所有人，即浏览者分配读取权限。
playground:playground	@ALL	2     //为playground:playground页面分配编辑权限。