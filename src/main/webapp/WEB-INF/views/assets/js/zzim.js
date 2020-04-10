
/** 페이지 로딩 시 실행되는 함수 */
$(() => {
    let page_user_id = $('.size').text();
    console.log(page_user_id);
    let nm = $('.name').text();
    console.log(nm);
    
    if (page_user_id != null && page_user_id != "") {
        $.get(ROOT_URL + "/zzim_count.do", {
        }, function(json) {
            if (json.rt === "OK") {
                console.log(json.count);
                if (json.count > 0) {
                    $("#zzimbt_lg").css("color","#337ab7");
                    $('.badge').html(json.count);
                }
            }
        });
        
        $.get(ROOT_URL + "/zzim_find_place.do", {
        	"nm" : nm
        }, function(json){
        	if (json.result !== "null" && json.result.zzim_ok_not === 1) {
        			$("#bookmark").css("color", "rgb(51, 122, 183)");					
        	} else if (json.result === "null" && json.result.zzim_ok_not === 0) {
        		$("#bookmark").css("color", "#ccc");
        	}
        });
    }
    
});