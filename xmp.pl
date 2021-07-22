#!/bin/perl

# режим кропа, если да, то только "кропаем" существующие xmp
my $iscrop=0; # не кроп режим по умолчанию


my ($oneXMP, $twoXMP, $crop) = @ARGV;

$iscrop=1 if ($crop eq'crop');

print "Кроп режим!!!\n" if ($iscrop);

my   $oneHead=0;
my   $oneNum =0;
my   $twoNum =0;
my   $oneTail=0;

if ($oneXMP =~ /^([^_]+_)(\d+)(\.\w+)/) {
   $oneHead=$1;
   $oneNum=$2;
   $oneTail=$3;
}

if ($twoXMP =~ /^([^_]+_)(\d+)(\.\w+)/) {
   $twoNum=$2;
}

my $OneWhiteBalance=0;
my $OneTemperature=0;
my $OneTint=0;
my $OneVibrance=0;
my $OneExposure2012=-1;
my $OneContrast2012=-1;
my $OneHighlights2012=-1;
my $OneShadows2012   =-1;
my $OneWhites2012    =-1;
my $OneBlacks2012    =-1;
my $OneClarity2012   =-1;
my $OneDehaze        =-1;
my $OneCropTop       =0;
my $OneCropLeft      =0;
my $OneCropBottom    =1;
my $OneCropRight     =1;

my $TwoTemperature=0;
my $TwoTint=0;
my $TwoVibrance=0;
my $TwoExposure2012=-1;
my $TwoContrast2012=-1;
my $TwoHighlights2012=-1;
my $TwoShadows2012   =-1;
my $TwoWhites2012    =-1;
my $TwoBlacks2012    =-1;
my $TwoClarity2012   =-1;
my $TwoDehaze        =-1;
my $TwoCropTop       =0;
my $TwoCropLeft      =0;
my $TwoCropBottom    =1;
my $TwoCropRight     =1;

#Читаем первый файл 
if ((not defined $oneXMP) or (not defined $twoXMP))  {
  die "xmp.pl 1.xmp 2.xmp [crop]\n";
}

open(my $one, '<', $oneXMP) or die "Unable to open file, $!";
print "файл:  $oneXMP\n";


while (<$one>) { 
   $OneWhiteBalance=$1 if (/\S*crs:WhiteBalance=\"([^\"]+)\"/);

   $OneTemperature    =$1 if (/\S*crs:Temperature=\"([^\"]+)\"/);
   $OneTint           =$1 if (/\S*crs:Tint=\"([^\"]+)\"/);
   $OneVibrance       =$1 if (/\S*crs:Vibrance=\"([^\"]+)\"/);
   $OneExposure2012   =$1 if (/\S*crs:Exposure2012=\"([^\"]+)\"/);
   $OneContrast2012   =$1 if (/\S*crs:Contrast2012=\"([^\"]+)\"/);
   $OneHighlights2012  =$1 if (/\S*crs:Highlights2012=\"([^\"]+)\"/);
   $OneShadows2012     =$1 if (/\S*crs:Shadows2012=\"([^\"]+)\"/);
   $OneWhites2012      =$1 if (/\S*crs:Whites2012=\"([^\"]+)\"/);
   $OneBlacks2012      =$1 if (/\S*crs:Blacks2012=\"([^\"]+)\"/);
   $OneClarity2012     =$1 if (/\S*crs:Clarity2012=\"([^\"]+)\"/);
   $OneDehaze          =$1 if (/\S*crs:Dehaze=\"([^\"]+)\"/);
   $OneCropTop         =$1 if (/\S*crs:CropTop=\"([^\"]+)\"/);
   $OneCropLeft        =$1 if (/\S*crs:CropLeft=\"([^\"]+)\"/);
   $OneCropBottom      =$1 if (/\S*crs:CropBottom=\"([^\"]+)\"/);
   $OneCropRight       =$1 if (/\S*crs:CropRight=\"([^\"]+)\"/);

#crs:Dehaze="+100"


#   last if $_ eq 'banana'; # Leave the while-loop.
}
close($one) or warn "Unable to close the file handle: $!";


 print "Баланс белого:  $OneWhiteBalance\n";
 print "Цв.температура: $OneTemperature\n";
 print "Цветовой тон:   $OneTint\n";
 print "Насыщенность:   $OneVibrance\n";
 print "Экспозиция:     $OneExposure2012\n";
 print "Контраст:       $OneContrast2012\n";
 print "Света:          $OneHighlights2012\n";
 print "Тени:           $OneShadows2012\n";
 print "Белый:          $OneWhites2012\n";
 print "Черный:         $OneBlacks2012\n";
 print "Микроконтраст:  $OneClarity2012\n";
 print "Dehaze:         $OneDehaze\n";

 print "OneCropTop            $OneCropTop   \n";
 print "OneCropLeft           $OneCropLeft  \n";
 print "OneCropBottom         $OneCropBottom\n";
 print "OneCropRight          $OneCropRight \n";


 print "\n===\n";

#Читаем Второй файл 

open(my $two, '<', $twoXMP) or die "Unable to open file, $!";
print "файл:  $twoXMP\n";


while (<$two>) { 
   print "Баланс белого $1\n" if (/\S*crs:WhiteBalance=\"([^\"]+)\"/);

   $TwoTemperature    =$1 if (/\S*crs:Temperature=\"([^\"]+)\"/);
   $TwoTint           =$1 if (/\S*crs:Tint=\"([^\"]+)\"/);
   $TwoVibrance       =$1 if (/\S*crs:Vibrance=\"([^\"]+)\"/);
   $TwoExposure2012    =$1 if (/\S*crs:Exposure2012=\"([^\"]+)\"/);
   $TwoContrast2012   =$1 if (/\S*crs:Contrast2012=\"([^\"]+)\"/);
   $TwoHighlights2012  =$1 if (/\S*crs:Highlights2012=\"([^\"]+)\"/);
   $TwoShadows2012     =$1 if (/\S*crs:Shadows2012=\"([^\"]+)\"/);
   $TwoWhites2012      =$1 if (/\S*crs:Whites2012=\"([^\"]+)\"/);
   $TwoBlacks2012      =$1 if (/\S*crs:Blacks2012=\"([^\"]+)\"/);
   $TwoClarity2012     =$1 if (/\S*crs:Clarity2012=\"([^\"]+)\"/);
   $TwoDehaze          =$1 if (/\S*crs:Dehaze=\"([^\"]+)\"/);
   $TwoCropTop         =$1 if (/\S*crs:CropTop=\"([^\"]+)\"/);
   $TwoCropLeft        =$1 if (/\S*crs:CropLeft=\"([^\"]+)\"/);
   $TwoCropBottom      =$1 if (/\S*crs:CropBottom=\"([^\"]+)\"/);
   $TwoCropRight       =$1 if (/\S*crs:CropRight=\"([^\"]+)\"/);

#   last if $_ eq 'banana'; # Leave the while-loop.
}
close($two) or warn "Unable to close the file handle: $!";


 print "Цв.температура: $TwoTemperature\n";
 print "Цветовой тон:   $TwoTint\n";
 print "Насыщенность:   $TwoVibrance\n";
 print "Экспозиция:     $TwoExposure2012\n";
 print "Контраст:       $TwoContrast2012\n";
 print "Света:          $TwoHighlights2012\n";
 print "Тени:           $TwoShadows2012\n";
 print "Белый:          $TwoWhites2012\n";
 print "Черный:         $TwoBlacks2012\n";
 print "Микроконтраст:  $TwoClarity2012\n";
 print "Dehaze:         $TwoDehaze\n";
 print "CropTop            $TwoCropTop   \n";
 print "CropLeft           $TwoCropLeft  \n";
 print "CropBottom         $TwoCropBottom\n";
 print "CropRight          $TwoCropRight \n";

 print "\n===Разница\n";


my $diffTemperature   = $OneTemperature   -$TwoTemperature   ;
my $diffTint          = $OneTint*1        -$TwoTint*1        ;
my $diffVibrance      = $OneVibrance      -$TwoVibrance      ;
my $diffExposure2012  = $OneExposure2012  -$TwoExposure2012  ;
my $diffContrast2012  = $OneContrast2012  -$TwoContrast2012  ;
my $diffHighlights2012= $OneHighlights2012-$TwoHighlights2012;
my $diffShadows2012   = $OneShadows2012   -$TwoShadows2012   ;
my $diffWhites2012    = $OneWhites2012    -$TwoWhites2012    ;
my $diffBlacks2012    = $OneBlacks2012    -$TwoBlacks2012    ;
my $diffClarity2012   = $OneClarity2012   -$TwoClarity2012   ;
my $diffDehaze        = $OneDehaze        -$TwoDehaze        ;

my $diffCropTop        = $OneCropTop       -$TwoCropTop       ;
my $diffCropLeft       = $OneCropLeft      -$TwoCropLeft      ;
my $diffCropBottom     = $OneCropBottom    -$TwoCropBottom    ;
my $diffCropRight      = $OneCropRight     -$TwoCropRight     ;

 print "Цв.температура: $diffTemperature \n";
 print "Цветовой тон:   $diffTint        \n";
 print "Насыщенность:   $diffVibrance    \n";
 print "Экспозиция:     $diffExposure2012\n";
 print "Контраст:       $diffContrast2012\n";
 print "Света:          $diffHighlights2012\n";
 print "Тени:           $diffShadows2012 \n";
 print "Белый:          $diffWhites2012  \n";
 print "Черный:         $diffBlacks2012  \n";
 print "Микроконтраст:  $diffClarity2012 \n";
 print "Dehaze:         $diffDehaze      \n";

 print "CropTop            $diffCropTop         \n";
 print "CropLeft           $diffCropLeft        \n";
 print "CropBottom         $diffCropBottom      \n";
 print "CropRight          $diffCropRight       \n";


$lenNum=length($oneNum);
my $pat="%0".$lenNum."d";

my $j=0;

for ($i=$oneNum+1;$i<$twoNum;$i=$i+1) {
$result = sprintf($pat,$i);

  my $fileName=$oneHead.$result.$oneTail;

  print "$fileName\n";

open( $one, '<', $oneXMP) or die "Unable to open file, $!"   if !($iscrop);
open( $one, '<', $fileName) or die "Unable to open file, $!" if  ($iscrop);


open( $out, '>', $fileName) or die "Unable to open file, $!"       if !($iscrop);
open( $out, '>', $fileName.'.tmp') or die "Unable to open file, $!" if  ($iscrop);


  $j=$j+1;

  $CurrTemperature   = (int ($diffTemperature   /($oneNum-$twoNum)*$j)+$OneTemperature   );
  $CurrTint          = (int ($diffTint          /($oneNum-$twoNum)*$j)+$OneTint          );

  $CurrExposure2012  = sprintf("%.2f",(($diffExposure2012  /($oneNum-$twoNum)*$j)+$OneExposure2012))  ;

  $CurrVibrance      = (int ($diffVibrance      /($oneNum-$twoNum)*$j)+$OneVibrance      );
  $CurrContrast2012  = (int ($diffContrast2012  /($oneNum-$twoNum)*$j)+$OneContrast2012  );
  $CurrHighlights2012= (int ($diffHighlights2012/($oneNum-$twoNum)*$j)+$OneHighlights2012);
  $CurrShadows2012   = (int ($diffShadows2012   /($oneNum-$twoNum)*$j)+$OneShadows2012   );
  $CurrWhites2012    = (int ($diffWhites2012    /($oneNum-$twoNum)*$j)+$OneWhites2012    );
  $CurrBlacks2012    = (int ($diffBlacks2012    /($oneNum-$twoNum)*$j)+$OneBlacks2012    );
  $CurrClarity2012   = (int ($diffClarity2012   /($oneNum-$twoNum)*$j)+$OneClarity2012   );
  $CurrDehaze        = (int ($diffDehaze        /($oneNum-$twoNum)*$j)+$OneDehaze        );
  
  $CurrCropTop       = sprintf("%.6f",(($diffCropTop     /($oneNum-$twoNum)*$j)+$OneCropTop   ));
  $CurrCropLeft      = sprintf("%.6f",(($diffCropLeft    /($oneNum-$twoNum)*$j)+$OneCropLeft  ));
  $CurrCropBottom    = sprintf("%.6f",(($diffCropBottom  /($oneNum-$twoNum)*$j)+$OneCropBottom));
  $CurrCropRight     = sprintf("%.6f",(($diffCropRight   /($oneNum-$twoNum)*$j)+$OneCropRight ));
                                      
  while (<$one>) { 

if (!$iscrop) {

  
     if ($OneWhiteBalance eq "As Shot") {
#        print "OneWhiteBalance='$OneWhiteBalance'\n";

     } else {
       $_=$1.$CurrTemperature.$3."\n" if (/^(\s*crs:Temperature=\")([^\"]+)(\")/);
       $_=$1.$CurrTint.$3."\n"        if (/^(\s*crs:Tint=\")([^\"]+)(\")/);

     }

     $_=$1.$CurrExposure2012.$3."\n"    if (/^(\s*crs:Exposure2012=\")([^\"]+)(\")/);

     $_=$1.$CurrVibrance.$3."\n"  if (/^(\s*crs:Vibrance=\")([^\"]+)(\")/);
     $_=$1.$CurrContrast2012.$3."\n"    if (/^(\s*crs:Contrast2012=\")([^\"]+)(\")/);
     $_=$1.$CurrHighlights2012.$3."\n"  if (/^(\s*crs:Highlights2012=\")([^\"]+)(\")/);
     $_=$1.$CurrShadows2012.$3."\n"     if (/^(\s*crs:Shadows2012=\")([^\"]+)(\")/);
     $_=$1.$CurrWhites2012.$3."\n"      if (/^(\s*crs:Whites2012=\")([^\"]+)(\")/);
     $_=$1.$CurrBlacks2012.$3."\n"      if (/^(\s*crs:Blacks2012=\")([^\"]+)(\")/);
     $_=$1.$CurrClarity2012.$3."\n"     if (/^(\s*crs:Clarity2012=\")([^\"]+)(\")/);
     $_=$1.$CurrDehaze.$3."\n"          if (/^(\s*crs:Dehaze=\")([^\"]+)(\")/);
}

     $_=$1.$CurrCropTop.$3."\n"         if (/^(\s*crs:CropTop=\")([^\"]+)(\")/);
     $_=$1.$CurrCropLeft.$3."\n"        if (/^(\s*crs:CropLeft=\")([^\"]+)(\")/);
     $_=$1.$CurrCropBottom.$3."\n"      if (/^(\s*crs:CropBottom=\")([^\"]+)(\")/);
     $_=$1.$CurrCropRight.$3."\n"       if (/^(\s*crs:CropRight=\")([^\"]+)(\")/);

     print $out $_;

  }
  close($one) or warn "Unable to close the file handle: $!";
  close($out) or warn "Unable to close the file handle: $!";

  rename $fileName.'.tmp', $fileName if ($iscrop);

}

