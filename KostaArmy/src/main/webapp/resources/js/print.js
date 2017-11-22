var initBody;
function beforePrint() {
   initBody = document.body.innerHTML;
   document.body.innerHTML = initBody;
}

function afterPrint() {
   document.body.innerHTML = print_page.innerHTML;
}

function pageprint() {
    
    document.all.cattery.style.display = "none"; // 안보일때
    document.all.menu.style.display = "none";
    document.all.btnall.style.display = "none";
    document.all.btnall2.style.display = "none";
    document.all.schedule.style.width = "100%";

    window.onbeforeprint = beforePrint;
    window.onafterprint = afterPrint;
    window.print();

    document.all.cattery.style.display = ""; // 보일때
    document.all.menu.style.display = "";
    document.all.btnall.style.display = "";
    document.all.btnall2.style.display = "";
    document.all.schedule.style.width = "70%";
    
 }
var win = null;

 /*월간 종합 인쇄*/
function btn_printMonth(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{  width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>월 간 종 합</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>');
   win.document.close();
   win.print();
   win.close();
}

/*보급 관리 & 소비*/
function btn_printSupply(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>보급 관리 & 소비</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>');
   win.document.close();
 
   win.print();
   win.close();
}

/*물자 발주 현황 */
function btn_printSupplyOrder(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>물자 발주 현황</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>');
   win.document.close();
   win.print();
   win.close();
}

/*중대 간부 리스트 인쇄*/
function btn_printCadre(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>중대 간부 리스트</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>');
   win.document.close();
   win.print();
   win.close();
}
/*대대 간부 리스트 인쇄*/
function btn_printCadreAll(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>대대 간부 리스트</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>');
   win.document.close();
   win.print();
   win.close();
}
/*초소 근무 인쇄*/
function btn_printTower(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write(printThis);

   win.document.close();
   win.print();
   win.close();
}

/*불침 근무 인쇄*/
function btn_printNight(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write(printThis);

   win.document.close();
   win.print();
   win.close();
}

/* 결제 소비 내역 인쇄 */
function btn_printDate(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>결제 내역 & 소비 내역</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>')
   win.document.close();
   win.print();
   win.close();
}

/* 중대 병사 리스트 출력  */
function btn_printSoldier(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>중대 병력 현황</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>')
   win.document.close();
   win.print();
   win.close();
}

/* 대대  병사 리스트 출력  */
function btn_printSoldierAll(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>대대 병력 현황</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>')
   win.document.close();
   win.print();
   win.close();
}

/* 월급 명세서  */
function btn_printPay(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write(printThis);
   win.document.close();
   win.print();
   win.close();
}

/* 대대 발주 신청 리스트  */
function btn_printSupplyGrupe(printThis){
   win= window.open();
   self.focus();
   win.document.open();
   win.document.write('<style>table{ width: 100%; border:1px solid #000;}</style>');
   win.document.write('<body><center><h2>대대 발주 신청 리스트</h2></center>');
   win.document.write(printThis);
   win.document.write('</body>')
   win.document.close();
   win.print();
   win.close();
}