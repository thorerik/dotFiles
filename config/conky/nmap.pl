#!/usr/bin/perl
################
######## NMAP SCRIPT
##author: iltiscat
#mail:	schmiddim@gmx.at
#web:  	http://schmiddi.co.cc
#date:	02.10.09
#desc: 	a small script for conky lists all ip's in your subnet. 
#use:	write ${execi 100 ~/.conky/nmap.pl wlan0} in your ~/.conkyrc
#	100 means the refresh intervall in seconds. 
#	you can assign a interface with the argument. Without,
#	the subnet of eth0 will be analyzed. HF:)
	
$adapter= @ARGV[0];
if (@ARGV[0] eq""){
	$adapter ="eth0";
}#fi

#get my ip
$string =  `ifconfig $adapter`;
$string =~m/([0-9]+\.){3}[0-9]+/g;
$myip=$&;

#connected?
$status=  system ("ping -c 1 $myip  -t 2 >/dev/null");
if ($status != 0) {
	print "not connected to a network :-(\n";
	exit (-1); #no network connection
}


#get the subnet
$str= $myip;

while($myip =~ m/\w\.\b/g) {$lastpos= pos($myip), " " };
	$subnet = substr($myip,0, $lastpos-1);
$subnet= "$subnet.1-255\n";

#parse the nmap result
$retval = `nmap -sP $subnet`;
$ctr=0;
$_=$retval;
	while (/([0-9]+\.){3}[0-9]+/g) {
		if ($ctr%2 == 0) {
			print  "$&\t";
			}else{
			print "$&\n";
		}#fi
    $ctr++;
  }

if ($ctr%2 ==0) {
	print "";
}else{
	print"\n";
}
print "$ctr hosts up\n";
