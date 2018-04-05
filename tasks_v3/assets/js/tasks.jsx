import React from 'react';
import { connect } from 'react-redux';

import Task from './task';

function Tasks(props) {
  let tasks = _.map(props.tasks, (task) => <Task key={task.id} task={task} />);
  return (
    <div>
      { tasks }
     </div>
  );
}

export default connect(({tasks}) => {return {tasks};})(Tasks);
