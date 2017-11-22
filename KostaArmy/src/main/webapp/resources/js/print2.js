var initBody;

/*월간 휴가 종합 */
function beforePrint() {
   initBody = document.body.innerHTML;
   document.body.innerHTML = initBody;
}

function afterPrint() {
   document.body.innerHTML = print_page.innerHTML;
}

function pageprint() {

    window.onbeforeprint = beforePrint;
    window.onafterprint = afterPrint;
    window.print();

 }