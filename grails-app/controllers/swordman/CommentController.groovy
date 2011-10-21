package swordman
import grails.converters.JSON
class CommentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
  	def gswordService
    def index = {
        redirect(action: "list", params: params)
    }

    def search= {
	
	def comment=Comment.withCriteria{
		//like("cmnt","%${params.cmnt}%")
		like("referencetext","%${params.cmnt}%")
	 }
        [commentInstanceList: comment, commentInstanceTotal: comment.count()]
    }
    def searchJSON= {
/*	
	def comment=Comment.withCriteria{
		like("referencetext","%${params.cmnt}%")
	 }
*/
       def url='http://www.ccimweb.org'
       def data=gswordService.call_dyurl(params,url)
        render data as JSON
    }
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [commentInstanceList: Comment.list(params), commentInstanceTotal: Comment.count()]
    }

    def create = {
        def commentInstance = new Comment()
        commentInstance.properties = params
        return [commentInstance: commentInstance]
    }

    def save = {
        def commentInstance = new Comment(params)
        if (commentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])}"
            redirect(action: "show", id: commentInstance.id)
        }
        else {
            render(view: "create", model: [commentInstance: commentInstance])
        }
    }

    def show = {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [commentInstance: commentInstance]
        }
    }

    def edit = {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [commentInstance: commentInstance]
        }
    }

    def update = {
        def commentInstance = Comment.get(params.id)
        if (commentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (commentInstance.version > version) {
                    
                    commentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'comment.label', default: 'Comment')] as Object[], "Another user has updated this Comment while you were editing")
                    render(view: "edit", model: [commentInstance: commentInstance])
                    return
                }
            }
            commentInstance.properties = params
            if (!commentInstance.hasErrors() && commentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])}"
                redirect(action: "show", id: commentInstance.id)
            }
            else {
                render(view: "edit", model: [commentInstance: commentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def commentInstance = Comment.get(params.id)
        if (commentInstance) {
            try {
                commentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])}"
            redirect(action: "list")
        }
    }

   def perf={
       render(view: "p", model: [data:gswordService.call_dyurl(params,'http://www.ccimweb.org/gsword/gbook/display?bible=kjv&key=gen 1:2&start=1&limit=10')])
    }

}
