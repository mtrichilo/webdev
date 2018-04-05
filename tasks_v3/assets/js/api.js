import store from './store';

class TasksApi {
  request(path, method, type) {
    $.ajax(path, {
      method: method,
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

  get(path, type) {
    this.request(path, "get", type);
  }

  post(path, type) {
    this.request(path, "post", type);
  }

  getUsers() {
    this.get("/api/v3/user", '');
  }

  getTasks() {
    this.get("/api/v3/tasks", 'TASKS_LIST');
  }
}

export default new TasksApi();
