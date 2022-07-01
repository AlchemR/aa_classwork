export const fetchAllTodos = () => (
  $.ajax({
    url: '/api/todos',
    method: 'GET'
  })
);

export const createTodo = (todo) => (
  $.ajax({
    url: '/api/todos',
    method: 'POST',
    data: {
      todo
    }
  })
)