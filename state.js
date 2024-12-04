let student_id = null; // Declare as a variable, not const


function get_student_id() {
  return student_id;
}

function set_student_id(id) {
  student_id = id;
}

module.exports = { get_student_id, set_student_id };
