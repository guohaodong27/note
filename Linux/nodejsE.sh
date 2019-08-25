#!bin-bash
echo "weclome to use node.js Environment configuration by one key"
echo "please input the binaries package url"
read nodejs
filename=$(echo ${nodejs##*/})
wget $nodejs -O $filename
if [[ $nodejs == *"tar.gz" ]] 
then
tar -xzf $filename -O $filename
elif [[ $nodejs == *"tar.xz" ]]
then
#移动到/usr/share文件夹下
dirname=${filename%%\.tar\.xz}
tar -xJf $filename -O $dirname
mv $dirname /usr/share/
#配置环境变量
echo "export PATH=\$PATH:/usr/share/${dirname}/bin"
#make
make /usr/share/${filename}/lib/node_modules/npm/ install
#更改镜像
npm config set registry https://registry.npm.taobao.org
#检验镜像
origin=npm config get registry
echo 
echo the origin has been changed to ${origin}
echo 
else
echo can\'t distinguish this url
fi
