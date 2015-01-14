package com.project.model;

import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document(collection="project")
public class Project {
    private String id;
    private String name;
    private List<Task> taskList;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Task> getTaskList() {
        return taskList;
    }

    public void setTaskList(List<Task> taskList) {
        this.taskList = taskList;
    }
}
