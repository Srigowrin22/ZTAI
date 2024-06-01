package com.ztai.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ztai.database.Database;
import java.util.List;

public class TodoAction extends ActionSupport {
	private int tid;
	private String ZTAIID;
	private String todoNote;
	private boolean completed;
	private List<String> todos;

	
	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getZTAIID() {
		return ZTAIID;
	}

	public void setZTAIID(String ZTAIID) {
		this.ZTAIID = ZTAIID;
	}

	public String getTodoNote() {
		return todoNote;
	}

	public void setTodoNote(String todoNote) {
		this.todoNote = todoNote;
	}
	
	public boolean getCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	public String addTodo() {
		System.out.println("addTodo");
		if (Database.getInstance().addTodo(ZTAIID, todoNote)) {
			todos = Database.getInstance().getTodo(ZTAIID);
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	
	public String deleteTodo() {
        System.out.println("deleteTodo");
        if (Database.getInstance().deleteTodo(tid)) {
            todos = Database.getInstance().getTodo(ZTAIID);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
	
	public String updateTodo() {
        if (Database.getInstance().updateTodo(tid, completed)) {
            todos = Database.getInstance().getTodo(ZTAIID);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
}
