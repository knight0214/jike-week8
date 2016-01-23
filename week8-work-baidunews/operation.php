<?php
header( "Content-type:text/html;charset=utf-8"); 
$con = mysql_connect("localhost","root","");
//判断是否连接成功
if (!$con)
  {  
  die('Could not connect: ' . mysql_error());
  }else{
         //选择phplesson数据库
         mysql_select_db("baidunews", $con);
         mysql_query("SET NAMES'utf-8'");
          $newsKey=$_REQUEST['newsKey'];
          if ($newsKey=='add') {
          $newsclass= $_REQUEST['newsclass'];
          $newshref= $_REQUEST['newshref'];
          $newstitle= $_REQUEST['newstitle'];
          $newstext= $_REQUEST['newstext'];
          $newsimg1= $_REQUEST['newsimg1'];
          $newsimg2= $_REQUEST['newsimg2'];
          $newsimg3= $_REQUEST['newsimg3'];
          $newstype= $_REQUEST['newstype'];
          $addtime= $_REQUEST['addtime'];
          $newstag= $_REQUEST['newstag'];
          $tagcolor= $_REQUEST['tagcolor'];
          $sql= "INSERT INTO `newscontrol`( `newsclass`,`newshref`,`newstitle`,`newstext`,`newsimg1`, `newsimg2`,`newsimg3`, `newstype`, `addtime`,`newstag`,`tagcolor`) VALUES ('".$newsclass."','".$newshref."','".$newstitle."','".$newstext."','".$newsimg1."','".$newsimg2."','".$newsimg3."','".$newstype."','".$addtime."','".$newstag."','".$tagcolor."')";
          $result=mysql_query($sql,$con);
          }else if ($newsKey=='del') {
             $newsid= implode(",",$_POST['newsid']);
             $sql="DELETE FROM `newscontrol` WHERE `newsid`in ($newsid)";
            $result=mysql_query($sql,$con);
          }else if ($newsKey=='update') {
          $newsid=$_REQUEST['newsid'];  
          $newsclass= $_REQUEST['newsclass'];
          $newshref= $_REQUEST['newshref'];
          $newstitle= $_REQUEST['newstitle'];
          $newstext= $_REQUEST['newstext'];
          $newsimg1= $_REQUEST['newsimg1'];
          $newsimg2= $_REQUEST['newsimg2'];
          $newsimg3= $_REQUEST['newsimg3'];
          $newstype= $_REQUEST['newstype'];
          $addtime= $_REQUEST['addtime'];
          $newstag= $_REQUEST['newstag'];
          $tagcolor= $_REQUEST['tagcolor'];
          $sql="UPDATE `newscontrol` SET `newsclass`='".$newsclass."',`newshref`='".$newshref."',`newstitle`='".$newstitle."',`newstext`='".$newstitle."',`newsimg1`='".$newsimg1."',`newsimg2`='".$newsimg2."',`newsimg3`='".$newsimg3."',`newstype`='".$newstype."',`addtime`='".$addtime."',`newstag`='".$newstag."',`tagcolor`='".$tagcolor."' WHERE `newsid`= ".$newsid." ";
           $result=mysql_query($sql,$con);
          }
          if (!$result) {
           
             echo "操作失败";
            die('Error:'.mysql_error());
          }else{
            echo "操作成功";
           
          }
        
      }

mysql_close($con);
?>