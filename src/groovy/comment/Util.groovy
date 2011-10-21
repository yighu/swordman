package comment;
class Util{
/*
public static String processScript(String txt){
//def result= txt.replaceAll(/<bb>([ \tA-Za-z0-9]+)<\/bb>/) { wholeMatch, lastTwoChars ->
def result= txt.replaceAll(/&lt;bb&gt;([ \tA-Za-z0-9]+)&lt;\/bb&gt;/) { wholeMatch, lastTwoChars ->
   return "<a href=\"//" + lastTwoChars?.trim()+"\">"+lastTwoChars.trim()+"</a>"
}
println result
return result
}
*/
def static processScript(rawtxt){

      rawtxt.replaceAll(/&lt;z&gt;(.*?)&lt;\/z&gt;/){fullmatch,txt->

            //return "<a http://${txt?.trim()} >${txt?.trim()}</a>"

//return """<a onclick="return getDetail('${txt?.trim()}');" href="http://${txt?.trim()}">${txt?.trim()}</a>"""
return """<a href="javascript:getDetail('${txt?.trim()}');">${txt?.trim()}</a>"""
            }

}

def static processKey(params){
		def key=params.key
		if (key.contains("/")){
			def k=key.split("/")
			params.bible=k[0]
			params.key=k[1]
		}else{
			params.bible="KJV"
		}	
	params
	}
}
