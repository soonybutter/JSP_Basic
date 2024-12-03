/**
 * 
 */

$(function(){
    getJson();

});

function getJson(){
    //제이쿼리의 getJSON()이용하여 제이슨 데이터 받아온다. 
    $.getJSON( "json/bike.json",function(data){
        $.each(data, function(key,val){
            if(key=="DESCRIPTION"){
				$("table").attr("border","1");
				$("thead").append(
					"<tr>"+
						"<th>"+val.ADDR_GU+"</th>"+
						"<th>"+val.CONTENT_ID+"</th>"+
						"<th>"+val.CONTENT_NM+"</th>"+
						"<th>"+val.NEW_ADDR+"</th>"+
						"<th>"+val.CRADLE_COUNT+"</th>"+
						"<th>"+val.LONGITUDE+"</th>"+
						"<th>"+val.LATITUDE+"</th>"+
					"</tr>");
			}
			else{
				//key가 DATA 일때
				// val에는 array가 들어가 있다
				for(let i=0;i<val.length; i++){
					let str = val[i];
					$("tbody").append(
						"<tr>"+
							"<td>"+str.addr_gu+"</td>"+
							"<td>"+str.content_id+"</td>"+
							"<td>"+str.content_nm+"</td>"+
							"<td>"+str.new_addr+"</td>"+
							"<td>"+str.cradle_count+"</td>"+
							"<td>"+str.longitude+"</td>"+
							"<td>"+str.latitude+"</td>"+
							"<input type='hidden' name='bike' value='"+
							str.addr_gu+"/"+str.content_id+"/"+str.content_nm+"/"+
							str.newaddr+"/"+str.cradle_count+"/"+str.longitude+"/"+str.latitude+"' />"+
						"</tr>"	
					);
				}
				
				
				
			}

        });
    } );
}