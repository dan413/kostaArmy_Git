function onDragStart(event) {

	event.dataTransfer.setData("text", event.target.id);
}

function onDragEnter(event) {

}

function onDragOver(event) {
	// 드롭이 가능하도록 기본 상태를 취소함
	event.preventDefault();
}

function onDrop(event) {

	// dataTransfer 객체로 부터 데이터를 꺼내옴
	var id = event.dataTransfer.getData("text");
	
	// 현재 문서객체에서 해당 요소를 가져옴
	var Element = document.getElementById(id);

	// 데이터가 존재하고 드래그 대상과 드롭 대상이 같지 않을 경우 드롭 실행
	if (Element && Element.parentNode != event.currentTarget) {
		// 드래그 대상에서 이동할 데이터 삭제
		Element.parentNode.removeChild(Element);
		// 드롭 대상에 데이터 추가
		event.currentTarget.appendChild(Element);
		//event.stopPropagation();
	}
	
	// 드롭 완료 후 이벤트 버블링을 막기 위해 호출
	event.stopPropagation();

}

