var form1 = document.getElementById('pageAccueilRecherche');
var form2 = document.getElementById('pageAccueilBillet');
function page(){
	if (form1.style.display == "none")
		{
			form1.style.display = "block";
			form2.style.display = "none";
		}
	else if (form1.style.display == "" || form1.style.display == "block")
		{
			form2.style.display = "block";
			form1.style.display = "none";
		}
	else 
		{
			alert('erreur fonction page');
		}
}