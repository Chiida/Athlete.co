for framework in Framework/*.framework; do
  fname=$(basename $framework .framework)
  echo $fname
  nm $framework/$fname | grep UIWebView
done
