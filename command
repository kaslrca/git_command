### 查看當前的branch離最近的tag之間，是自己commit的log
git config --global alias.gg \!" git --no-pager log --author=\$(git config --get user.name) --format=\"%C(dim)%ci%C(reset) %C(dim white)%h%C(reset)   %C(magenta)%s%C(reset)\" \$(git for-each-ref --format '%(refname)' refs/tags | grep \"refs/tags/v\" | sort | tail -1)..\$(git branch | grep \"^*\" | cut -d ' ' -f 2) | grep -v -e \"Merge branch\" -e \"Merged\""
### 同上 但能額外自己加git log的參數
git config --global alias.gg \!"f() { git --no-pager log \$@ --author=\$(git config --get user.name) --format=\"%C(dim green)%ci%C(reset) %C(dim white)%h%C(reset)   %C(magenta)%s%C(reset)\" \$(git for-each-ref --format '%(refname)' refs/tags | grep \"refs/tags/v\" | sort | tail -1)..\$(git branch | grep \"^*\" | cut -d ' ' -f 2) | grep -v -e \"Merge branch\" -e \"Merged\"; }; f"

### 查看兩個commit之間的log
git config --global alias.sl \!"f()  { git --no-pager  shortlog -n -e --format=\"%ci %h   %s\" \${1}..\${2} | grep -v -e \"Merge branch\" -e \"Merged\"; }; f"


### 查看danling物件
git fsck | grep dangling | awk '{print $3}' | xargs -n 1 -p git cat-file -p

git fsck --unreachable | grep commit | cut -d ' '  -f 3 | xargs git --no-pager log --merges --no-walk



git for-each-ref --sort=committerdate --format='%(refname:short) * %(authorname) * %(committerdate:relative)' refs/remotes/ | column -t -s '*'
