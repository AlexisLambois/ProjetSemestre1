
function compareDate(date1,date2){
	var temp1 = new Date(date1).getTime();
	var temp2 = new Date(date2).getTime();
	
	if(temp1==temp2){
		return 0;
	}else if(temp1<temp2){
		return -1;
	}else{
		return 1;
	}
}

function recup(string,id){
	document.getElementById(id.id).value=string.innerText;
}

