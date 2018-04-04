import store from './store';

class TasksApi {
  request(path, method, success) {
    $.ajax(path, {
      method: method,
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      success: success,
    });
  }

  get(path, success) {
    request(path, "get", success);
  }

  post(path, success) {
    request(path, "post", success);
  }

  getTasks() {
    get("/api/v3/tasks", (resp) => {
      store.dispatch({
        type: 'TASKS_LIST',
        tasks: resp.data,
      });
    });
  }
}

export default new TasksApi();
