


def result= txt.replaceAll(/<bb>([ \tA-Za-z0-9]+)<\/bb>/) { wholeMatch, lastTwoChars ->
   return "<a href=\"//" + lastTwoChars?.trim()+"\">"+lastTwoChars.trim()+"</a>"
}
