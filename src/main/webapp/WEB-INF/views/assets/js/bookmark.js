$('#bookmark').click((e) => {
    let nm = $('.name').text();
    console.log(nm);
        swal({
        title : '확인',
        text : '찜을 수정하시겠습니까?',
        type : 'warning',
        confirmButtonText : '예',
        showCancelButton : true,
        cancelButtonText : '아니오'
    }).then(function(result){
        if (result.value) {
        	$.get(ROOT_URL + "/zzim_find_place.do", {
        		"nm" : nm
        	}, function(json) {
        		if (json.result === "null") {
                	$.get(ROOT_URL + "/zzim_check.do", {
                		"nm" : nm
                	}, function(json) {
                		if (json.rt === "OK") {
                        swal('찜 수정을 완료하였습니다.','','success').then(function(result) {
                           if (result.value) {
                                window.location = ROOT_URL + "/page.do?nm=" + nm;
                              }
                          });
						}
                	});
				} else {
		            $.put(ROOT_URL + "/zzim_update.do", {
		                "nm" : nm
		            }, function(json) {
		                if (json.rt === "OK") {
		                	console.log(json.updatedCount)
		                    swal('찜 수정을 완료하였습니다.','','success').then(function(result) {
		                        if (result.value) {
		                            window.location = ROOT_URL + "/page.do?nm=" + nm;
		                        		}
		                    		});
		                        } else if(error.responseJSON.rt === 500) {
		                        	$.get(ROOT_URL + "/zzim_check.do", {
		                        		"nm" : nm
		                        	}, function(json) {
		                        		if (json.rt === "OK") {
		                                swal('찜 수정을 완료하였습니다.','','success').then(function(result) {
		                                   if (result.value) {
		                                        window.location = ROOT_URL + "/page.do?nm=" + nm;
		                                      }
		                                  });
		    							}
		                        	});
		                        }
		                    })
						}
        			});
            } else {
            	swal('취소하였습니다.','','error');
            }
        }
    );
})