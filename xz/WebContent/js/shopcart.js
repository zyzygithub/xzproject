   function selectall (state) { 
				var arr=document.getElementsByClassName("ck")
				for (var i = 0; i < arr.length; i++) {
					arr[i].checked=state;
				}
				if (state==false) {
				document.getElementById("totalprice").innerText=0; 
				document.getElementById("totalcount").innerText=0;	
				}
} 
		$(function  () {
			  $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();

			$(".add").click(function  () {
				var ckk = $(this).parents("tr").find("td").eq(0).find("input"); //当前行单选框的对象
				var mycount = parseInt($(this).parents("tr").find("td").eq(3).find("input").val());
				var dj= $(this).parents("tr").find("td").eq(5).text();
			if($(this).parents("tr").find("td").eq(3).find("input").val()!="")
			{
				mycount+=1
				dj= parseInt(dj)
				var test1= $(this).parents("tr").find("td").eq(6).text();
				s1= parseInt(test1)
				$(this).parents("tr").find("td").eq(3).find("input").val(mycount);
				$(this).parents("tr").find("td").eq(6).html(s1+dj);
				var myp = parseInt($(this).parents("tr").find("td").eq(6).text());
				data = $(this).parents("tr").siblings();
				if(ckk.prop("checked")){
				var sum = myp;
				var sumcount = mycount;	
				}
				for(var i = 0;i<data.length;i++){
					var mych = $(data[i]).find("td").eq(0).find("input");  //其他行的单选框的对象
					if(mych.prop("checked")){
					sum+=parseInt($(data[i]).find("td").eq(6).text());
					sumcount+=parseInt($(data[i]).find("td").eq(3).find("input").val());
				
			} }
		if(ckk.prop("checked")){
				$("#totalprice").html(sum);
			    $("#totalcount").html(sumcount);
			 
		}}
			});
			$(".sub").click(function  () {
					var ckk = $(this).parents("tr").find("td").eq(0).find("input"); //当前行单选框的对象
				var ckk=$(this).parents("tr").find("td").eq(0).find("input")
				var mycount = parseInt($(this).parents("tr").find("td").eq(3).find("input").val());
				var test1= $(this).parents("tr").find("td").eq(6).text();
				var dj= $(this).parents("tr").find("td").eq(5).text();
					if($(this).parents("tr").find("td").eq(3).find("input").val()!="")
			{
				s1= parseInt(test1)
				dj= parseInt(dj)
				if(mycount>1)
				mycount-=1
				$(this).parents("tr").find("td").eq(3).find("input").val(mycount); 
				if(s1>dj)
				s1-=dj;
				$(this).parents("tr").find("td").eq(6).html(s1);
				var myp = parseInt($(this).parents("tr").find("td").eq(6).text());
				data = $(this).parents("tr").siblings();
				//alert(data.length);
				if(ckk.prop("checked")){
				var sum = myp;
				var sumcount = mycount;	
				}
				for(var i = 0;i<data.length;i++){	
						var mych = $(data[i]).find("td").eq(0).find("input");  //其他行的单选框的对象
					if(mych.prop("checked")){
					sum+=parseInt($(data[i]).find("td").eq(6).text());
					sumcount+=parseInt($(data[i]).find("td").eq(3).find("input").val());
				
				}}
				if(ckk.prop("checked")){
				$("#totalprice").html(sum);
			    $("#totalcount").html(sumcount);}
			}});		
		$("#qx").click(function  () {
			var ss=data = $(this).parents("tr").siblings();
			var sum = 0;
				var sumcount = 0;	
			for(var i = 0;i<data.length;i++){	
					 sum+=parseInt($(data[i]).find("td").eq(6).text());
					 sumcount+=parseInt($(data[i]).find("td").eq(3).find("input").val());	
				}
						
			if($(this).prop("checked")){
			$("#totalprice").html(sum);
			    $("#totalcount").html(sumcount);}
		})
		$(".ck").click(function  () {
					var myp = parseInt($(this).parents("tr").find("td").eq(6).text());
					var ckk=$(this).parents("tr").find("td").eq(0).find("input")
					var mycount = parseInt($(this).parents("tr").find("td").eq(3).find("input").val());
				data = $(this).parents("tr").siblings();
				if($(this).parents("tr").find("td").eq(3).find("input").val()!="")
			{
				if(this.checked){
				var sum = myp;
				var sumcount = mycount;
				
				for(var i = 0;i<data.length;i++){
					var mych = $(data[i]).find("td").eq(0).find("input");  //其他行的单选框的对象
					if(mych.prop("checked")){
					sum+=parseInt($(data[i]).find("td").eq(6).text());
					sumcount+=parseInt($(data[i]).find("td").eq(3).find("input").val());   
				
			} }
				
			if(ckk.prop("checked")){
				
			$("#totalprice").html(sum);
			    $("#totalcount").html(sumcount);}
	
			}
			if (!this.checked) {
				 var totalprice=parseInt($("#totalprice").text())
				 var totalcount=parseInt($("#totalcount").text()) 
				 	$("#totalprice").html(totalprice-myp);
			    $("#totalcount").html(totalcount-mycount);
			}
			
		}})
		
		$(document).ready(function(){	
  $($("input")).keyup(function(){
data = $(this).parents("tr").siblings();
 var ss=parseInt($(this).val());
var dj=parseInt($(this).parents("tr").find("td").eq(5).text());
var mycount = parseInt($(this).parents("tr").find("td").eq(3).find("input").val());
var ckk = $(this).parents("tr").find("td").eq(0).find("input");
	$(this).parents("tr").find("td").eq(6).html(ss*dj);
	if(ckk.prop("checked")){
				var sum = ss*dj;
				var sumcount = mycount;	
				
				}
for(var i = 0;i<data.length;i++){
					var mych = $(data[i]).find("td").eq(0).find("input");  //其他行的单选框的对象
					if(mych.prop("checked")){
					sum+=parseInt($(data[i]).find("td").eq(6).text());
					sumcount+=parseInt($(data[i]).find("td").eq(3).find("input").val());
				
			} }	
	
if(ckk.prop("checked")){
				
			$("#totalprice").html(sum);
			    $("#totalcount").html(sumcount);}
  });

	});	
		$(".del").click(function(){
			
			
			//var myp =$(this).parents("tr").find(".ac").val();
			var myp =$(this).parents("tr").find("td").eq(8).find("input").val();
			location.href="CartServlet2?op=del&id="+myp;
			
		});
		$(".button").click(function(){
		$("#mytable").html()
		alert($("#mytable").find("tr").siblings().html());
			
		});

		})
             