function cepInput(route){
    let form = document.getElementById('formProvider');
    form.action = route;
    form.submit();  
 }