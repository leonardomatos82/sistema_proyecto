<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script>
function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit)
field.value = field.value.substring(0, maxlimit);
else 
countfield.value = maxlimit - field.value.length;
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
  <textarea name="coment1" cols="50" rows="3" onkeydown="textCounter(this.form.coment1,this.form.remLen,500);" 
				  onkeyup="textCounter(this.form.coment1,this.form.remLen,500);" value="<?php echo $coment1;?>" ><?php echo $coment1;?></textarea>
  <input readonly="readonly" type="text" name="remLen" size="1" maxlength="3" value="500" />

                  </form>
</body>
</html>
