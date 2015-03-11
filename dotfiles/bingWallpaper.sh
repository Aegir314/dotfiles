bingXML='http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US'
cd ~/Pictures
wget -q -O bing.xml $bingXML
data=$(<bing.xml)
url=$(sed -ne '/url/{s/.*<url>\(.*\)<\/url>.*/\1/p;q;}' <<< "$data")
wget -q -N "www.bing.com/$url"
file=$(sed 's#.*/##g' <<< "$url")
nitrogen --set-scaled $(pwd)/$file
