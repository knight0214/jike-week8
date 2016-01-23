<?php
header("Content-type:application/json; charset=utf-8"); 
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
         if ($newsKey=='rec'){
            $sql= "SELECT * FROM `newscontrol` WHERE `newsclass`='".$newsKey."'";
             
         }else if ($newsKey=='baijia') {
            $sql = "SELECT * FROM `newscontrol` WHERE `newsclass`='".$newsKey."'";
             
         }else if ($newsKey=='bendi') {
            $sql = "SELECT * FROM `newscontrol` WHERE `newsclass`='".$newsKey."'";
            
         }else if ($newsKey=='all'){
           $sql = "SELECT * FROM `newscontrol`";
           
         }else if ($newsKey=='edit') {
           $newsid= implode(",",$_GET['newsid']);
           $sql = "SELECT * FROM `newscontrol` WHERE `newsid`in ($newsid)";
           
         }
          
          $result=mysql_query($sql,$con);
          $arr=array();
          while($row = mysql_fetch_array($result)){
          	    array_push($arr, array("newsid"=>$row['newsid'],
                                       "newsclass"=>$row['newsclass'],
                                       "newshref"=>$row['newshref'],
                                       "newstitle"=>$row['newstitle'],
                                       "newstext"=>$row['newstext'],
                                       "newsimg1"=>$row['newsimg1'],
                                       "newsimg2"=>$row['newsimg2'],
                                       "newsimg3"=>$row['newsimg3'],
                                       "newstype"=>$row['newstype'],
                                       "addtime"=>$row['addtime'],
                                       "newstag"=>$row['newstag'],
                                       "tagcolor"=>$row['tagcolor']
                                       ));
                }
                // $result =array("errcode"=>0,"result"=>$arr);
                echo json_encode($arr);
        }
 


mysql_close($con);
?>