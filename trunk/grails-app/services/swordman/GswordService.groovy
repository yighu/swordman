package swordman
import groovyx.json.*
import groovyx.net.http.*
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*

class GswordService {

  boolean transactional = false
  def call_dyurl(org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap params, String url) {
    def result
	params=comment.Util.processKey(params)
    def http = new HTTPBuilder(url)
    http.request(GET, JSON) {
//      uri.path = '/gsword/gbook/randomVerseJSON'

      uri.path = '/gsword/gbook/display'
      params.put("start",0);
      params.put("limit",200);
      uri.query = params
      headers.'User-Agent' = 'Mozilla/5.0 Ubuntu/8.10 Firefox/3.0.4'
      response.success = {resp, json ->
        result = json
      }
      response.failure = {resp ->
	 Map mp = new HashMap()
    mp.put("data", resp.toString())
        result =mp;
      }
    }
    result
  }
}

//def myActivities = "https://www.googleapis.com/plus/v1/people/${myProfileId}/activities/public?key=${myKey}".toURL().text
// I simply parse the JSON payload
//def root = new JsonSlurper().parseText(myActivities)
