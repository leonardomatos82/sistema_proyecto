<!-- POSTIT -->
   
<style>
<!--
#postit2{
position:absolute;
width:580;
padding:1px;
background-color:silver;
border:1px solid black;
visibility:hidden;
z-index:20;
cursor:hand;
}
-->
</style>
 
</head>
 
    
<body>
 
<div id="postit2" style="left:430px;top:246px">
<div align="right"><b><a href="javascript:closeit2()"><font face="Arial" size="1">[CERRAR]</font></a></b></div>
 
<!-- INSERTA EL CONTENIDO AQU� -->
 <b>AVISO</b><br>
<p><font size="2" face="Arial"><br>
<? include("../calendario.php"); ?>



</br>
 
<!-- FIN DEL CONTENIDO -->
 
</div>
 
<script>
 
var once_per_browser2=0
 
///No modifiques lo que sigue///
 
var ns42=document.layers
var ie42=document.all
var ns62=document.getElementById&&!document.all
 
if (ns42)
crossobj2=document.layers.postit2
else if (ie42||ns62)
crossobj2=ns62? document.getElementById("postit2") : document.all.postit2
 

function closeit2(){
if (ie42||ns62)
crossobj2.style.visibility="hidden"
else if (ns42)
crossobj2.visibility="hide"
}
 
function get_cookie4(Name) {
  var search = Name + "="
  var returnvalue = "";
  if (document.cookie4.length > 0) {
    offset = document.cookie4.indexOf(search)
    if (offset != -1) { // if cookie4 exists
      offset += search.length
      // set index of beginning of value
      end = document.cookie4.indexOf(";", offset);
      // set index of end of cookie4 value
      if (end == -1)
         end = document.cookie4.length;
      returnvalue=unescape(document.cookie4.substring(offset, end))
      }
   }
  return returnvalue;
}
 
function showornot2(){
if (get_cookie4('postdisplay')==''){
showit2()
document.cookie4="postdisplay=yes"
}
}
 
function showit2(){
if (ie42||ns62)
crossobj2.style.visibility="visible"
else if (ns42)
crossobj2.visibility="show"
}
 
if (once_per_browser2)
showornot2()
else
showit2()
 
</script>
 
<script language="JavaScript1.2">
 
//funci�n arrastrar y soltar para ie4+ y NS6////
function drag_drop2(e){
if (ie42&&dragapproved2){
crossobj2.style.left=tempx2+event.clientX2-offsetx2
crossobj2.style.top=tempy2+event.clientY2-offsety2
return false
}
else if (ns62&&dragapproved2){
crossobj2.style.left=tempx2+e.clientX2-offsetx2
crossobj2.style.top=tempy2+e.clientY2-offsety2
return false
}
}
 
function initializedrag2(e){
if (ie42&&event.srcElement.id=="postit2"||ns62&&e.target.id=="postit2"){
offsetx2=ie42? event.clientX2 : e.clientX2
offsety2=ie42? event.clientY2 : e.clientY2
 
tempx2=parseInt(crossobj2.style.left)
tempy2=parseInt(crossobj2.style.top)
 
dragapproved2=true
document.onmousemove=drag_drop2
}
}
document.onmousedown=initializedrag2
document.onmouseup=new Function("dragapproved2=false")
 
</script>
