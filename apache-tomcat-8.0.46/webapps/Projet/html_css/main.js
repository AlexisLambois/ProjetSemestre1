
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

function initDate(){
	webshims.setOptions('forms-ext', {
		replaceUI: 'auto',
		types: 'date'
	});
	webshims.polyfill('forms forms-ext');

	$(function(){
		$('[type="date"].min-today').prop('min', function(){
			return new Date().toJSON().split('T')[0];
		});
	});
}