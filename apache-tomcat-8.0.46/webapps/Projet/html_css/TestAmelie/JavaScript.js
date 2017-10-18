var pageRecherche = document.getElementsByClassName('pageAccueilRecherche');
var pageBillet = document.getElementsByClassName('pageAccueilBillet');
function page(){
	if (getComputedStyle(pageRecherche[0]).display == "block")
	{
		pageRecherche[0].style.display = "none";
		pageBillet[0].style.display = "block";
	}
	else if (getComputedStyle(pageRecherche[0]).display == "none")
	{
		pageRecherche[0].style.display = "block";
		pageBillet[0].style.display = "none";
	}
}
