let student_id = null;

module.exports = {
  get_student_id: () => student_id,
  set_student_id: (id) => {
    student_id = id;
  },
};