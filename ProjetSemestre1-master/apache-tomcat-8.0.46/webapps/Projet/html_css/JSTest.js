var form1 = document.getElementById('form1');
var form2 = document.getElementById('form2');

function visibilite(element, visible){
	if(visible == 'non'){
		element.style.display = "none";
	}
	else if(visible == 'oui'){
		element.style.display = "block";
	}
}

function accueil()
{
	visibilite(form1, 'non');
	visibilite(form2, 'oui');
}

function accueil2()
{
	visibilite(form1, 'oui');
	visibilite(form2, 'non');
}

//form1.addEventListener('submit', accueil());
//form2.addEventListener('submit', accueil2());

