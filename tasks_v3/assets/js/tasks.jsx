import React from 'react';

import Task from './task';

export default function Tasks(props) {
  let tasks = _.map(props.tasks, (task) => <Task key={task.id} task={task} />);
  return (
    <div>
      { tasks }
     </div>
  );
}  
