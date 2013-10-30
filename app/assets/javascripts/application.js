var ajax_flag=true;
var SLCAjax=function(){
	this.action;
	this.getAction=function(){
		return this.action;
	}
	this.setAction=function(action){
		this.action=action;
	}
	
	
	//override
	this.exeReturn=function(){
		ajax_flag=true;
		this.getAccess().hidePageLoading();
		this.getAccess().exeReturn(this.getElementName());
	}
	this.runError=function(){
		alert("予期せぬ動作が発生しました。ページを更新します。");
		document.location = error_url;
	}
	this.ajaxException=function(transport, ex){
	//	alert(ex);
		this.runError();
	}
	this.isExamine_exe=function(){//ajax処理が実行可能か
		if(ajax_flag){
			ajax_flag=false;
			this.getAccess().showPageLoading();
			return true;
		}
		return false;
	}
	this.getRunExe=function(){
		return "run_exe";
	}
	this.init=function(){
		this.setParamList({});
		this.setElementName("run_exe");
		this.exe();
	}
}
SLCAjax.prototype=new LfAjax(access);
var TwitterAccess=function(){
	this.append=false;
	this.redirect=false;
	this.showTimeLine=function(){
		this.setAction("show");
		this.setElementName("run_exe");
		this.exe();
	}
	this.showTimeLineNext=function(maxId){
		this.setAction("show");
		this.append=true;
		this.setParamList({"maxId":maxId-1});
		this.setElementName("run_exe");
		this.exe();
	}
	this.add=function(id,user_id,imageUrl,date){
		thisObj=this;
			jConfirm($("#category_name").val()+"に追加しますか？",
				"確認",function(d) {
				if(d){
					thisObj.redirect=true;
					thisObj.setAction("add");
					thisObj.setParamList({"state[status]":id,
						"state[user_id]":user_id,
						"state[user_name]":$("#username_"+id).html(),
						"state[screen_name]":$("#screen_name_"+id).html(),
						"state[text]":$("#text_"+id).html(),
						"state[image]":imageUrl,
						"state[date]":date,
						"category_id":$("#category_id").val()});
					thisObj.setElementName("run_exe");
					thisObj.exe();
				}else{
					jAlert("キャンセルしました。");
				}
			});
	}
	//override
	//画面の書き換え処理
	this.output=function(data){		
		if(this.append){
			$("#nextButton").remove();
			$("#"+this.getElementName()).append(data);
			this.append=false;
		}else if(this.redirect){
			location.href="http://localhost:3000/"+data;
		}else{
			$("#"+this.getElementName()).html(data);
		}
		this.exeReturn();//レスポンス後処理を実行
	}
	this.getUrl=function(){//url of a request place 
		return "/twitter/"+this.getAction();
	}
}
TwitterAccess.prototype=new SLCAjax();
var twitterAccess=new TwitterAccess();