BEGIN { FS="　"; }
$1 ~ /^卷/  {
  section=$1;
  printf("%s\n",$0);
} 
$1 ~ /^第/  {
  printf("%s　%s\n",section,$0);
}
