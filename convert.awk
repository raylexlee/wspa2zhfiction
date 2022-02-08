$0 ~ /章/ { chapter=$0; }
$0 ~ /節/ { printf("%s %s\n",chapter, $0);}
