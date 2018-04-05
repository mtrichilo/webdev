import store from './store';

class TasksApi {
  get(path, type) {
    $.ajax(path, {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      success: (resp) => {
        store.dispatch({
          type: type,
          data: resp.data,
        }); 
      },
    });
  }

  genericPost(path, method, data, type) {
    $.ajax(path, {
      method: method,
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: data,
      success: (resp) => {
        store.dispatch({
          type: type,
          data: resp.data,
        }); 
      },
    });
  }
   
  post(path, data, type) {
    this.genericPost(path, "post", data, type);
  }

  put(path, data, type) {
    this.genericPost(path, "put", data, type);
  }

  submitLogin(login) {
    this.post("/api/v3/token", JSON.stringify(login), 'SET_TOKEN');
  }

  registerUser(register) {
    this.post("/api/v3/user", JSON.stringify(register), 'NEW_USER');
  }

  getUsers() {
    this.get("/api/v3/user", 'USER_LIST');
  }

  getTasks() {
    this.get("/api/v3/tasks", 'TASK_LIST');
  }

  createTask(task) {
    this.post("/api/v3/tasks", JSON.stringify(task), 'NEW_TASK');
  }

  updateTask(task, id) {
    this.put("/api/v3/tasks/" + id, JSON.stringify(task), 'UPDATE_TASK');
  }
}

export default new TasksApi();
