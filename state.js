let student_id = null;

function get_student_id() {
  return student_id;
}

function set_student_id(id) {
  student_id = id;
}

module.exports = { get_student_id, set_student_id };