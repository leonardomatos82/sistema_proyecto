function annuityCalc()
{
var pv	= parseFloat(document.getElementById("pv").value.replace("\,","."));
var r	= parseFloat(document.getElementById("r").value.replace("\,","."))/100;
var t	= parseFloat(document.getElementById("period").value.replace("\,","."));
var g	= parseFloat(document.getElementById("gracia").value.replace("\,","."));
var pmt	= document.getElementById("pmt");
var tipo_pago	= document.getElementById("tipo_pago");
var p0	= document.getElementById("p0");
var p1	= document.getElementById("p1");
var t1	= document.getElementById("t1");
var t2	= document.getElementById("t2");
var tv	= document.getElementById("tv");
if (g==""){g=0;}
t=t-g;
	var n;
	if (t1.checked) {n = 1;tipo_pago.value =360;}
	else if (t2.checked) {n = 4;tipo_pago.value = 90;}
        else if (t4.checked) {n = 2;tipo_pago.value = 180;}
	else				 {n = 12;tipo_pago.value = 30;}

	/*var z;
	z = 1 / (1 + r/n);
	
	if 		(p1.checked) { pmt.value = round(pv * (1-z) / (z * (1-Math.pow(z, t))), 2); }
	else	{ pmt.value = round(pv * (1-z) / (1-Math.pow(z, t)), 2); }
*/
	if (t <= 0) { pmt.value = pv; }
	else if (r <= 0) { pmt.value = pv / t; }
	else {
	var z = 1 / (1 + r/n);
	var div = 1 - Math.pow(z, t);
	if (p1.checked) { div *=  z; }
	pmt.value = round(pv * (1-z) / div, 2);	
	}
	
	//if 		(p1.checked) pmt* = (1 + r/n);
}	
/*	var w = annuityPayout(p,r,y);
	
	if (document.mainform.payTiming[1].checked)
		w *= (1 + r);

		
	function annuityPayout(p,r,y)
{
	return futureValue(p,r,y-1)/geomSeries(1+r,0,y-1);
	FV p*Math.pow(1+r,y);
	$PMT = ((1 - $Z) * $PV) / ($Z * (1 - pow($Z,$NPer)))
	$Z = 1 / (1 + ($Rate/12));
}
*/


/*/present value of a growing ordinary annuity
	if (pv.checked && p1.checked) {
	if (r == g) { tv.value = round(pmt * t / (1 + (r / n)), 2);}
	else 		{ tv.value = round(pmt / ((r - g)/n) * (1 - (Math.pow ( (1 + (g / n)) / (1 + (r / n)), t))), 2);}
	}
//present value of a growing annuity due
	else if (pv.checked && p0.checked) {
	if (r == g) { tv.value = round((pmt * (1 + (r / n))) * t / (1 + (r / n)), 2);}
	else 		{ tv.value = round((pmt * (1 + (r / n)))/ ((r - g)/n) * (1 - (Math.pow ( (1 + (g / n)) / (1 + (r / n)), t))), 2);}
	}
//future value of a growing ordinary annuity
	else if (fv.checked && p1.checked) { 
	if (r == g) { tv.value = round(pmt * t * (Math.pow (1 + (r / n), t - 1)), 2);}
	else 		{ tv.value = round(pmt * (((Math.pow (1 + (r / n), t)) - (Math.pow (1 + (g / n), t))) / ((r - g)/n)), 2);}
	}
//future value of a growing annuity due
	else if (fv.checked && p0.checked) {
	if (r == g) { tv.value = round((pmt * (1 + (r / n))) * t  * (Math.pow (1 + (r / n), t - 1)), 2);}
	else 		{ tv.value = round((pmt * (1 + (r / n))) * (((Math.pow (1 + (r / n), t)) - (Math.pow (1 + (g / n), t))) / ((r - g)/n)), 2);}
	}
}*/

function round(n,dig)
{
	X = n * Math.pow(10,dig);
	X= Math.round(X);
	return X / Math.pow(10,dig);
}

function resetValues(form)
{
  for(var i = 0; i < form.elements.length; i++) {
  if(form.elements[i].type == "text") { form.elements[i].value = 0;}
  }
}