/**
 * 
 */
const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=agree]');
    for(let i = 0; i < agreeChk.length; i++){
      agreeChk[i].checked = e.target.checked;
    }
});

$("#form").submit(function(){
    var day = $("#day").val();
    var month = $("#month").val();
    var year = $("#year").val();
    var age = 18;
    var mydate = new Date();
    mydate.setFullYear(year, month-1, day);

    var currdate = new Date();
    currdate.setFullYear(currdate.getFullYear() - age);
    if ((currdate - mydate) < 0){
        alert("Sorry, only persons over the age of " + age + " may enter this site");
        return false;
    }
    return true;
});