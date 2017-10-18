
function test(truc){
	console.log(truc[0]);
}

function disco(){
	window.location.href = "index.jsp";
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
