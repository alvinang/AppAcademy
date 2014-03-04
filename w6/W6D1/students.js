function UserException(message) {
   this.message = message;
   this.name = "UserException";
}

function Student (fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
}

Student.prototype.name = function () {
  return this.fname + " " + this.lname;
}

Student.prototype.enroll = function (course) {
  for (var i = 0; i < this.courses.length; i++ ){
    if (this.courses[i].conflictsWith(course)) {
      throw new UserException("Course Conflict!");
    }
  }

  this.courses.push(course);
  course.addStudents(this);
}

Student.prototype.courseLoad = function () {
  var courseLoad = {};
  for (var i = 0; i < this.courses.length; i++) {
    if (!courseLoad[this.courses[i].department]) {
      courseLoad[this.courses[i].department] = this.courses[i].credits;
    } else {
      courseLoad[this.courses[i].department] += this.courses[i].credits;
    }
  }
  return courseLoad;
}


function Course (name, department, credits, days, time){
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.days = days;
  this.time = time;
  this.students = [];
}

Course.prototype.addStudents = function(student) {
  this.students.push(student);
}

Course.prototype.conflictsWith = function (course) {
  for (var i = 0; i < course.days.length; i++ ){
    this.days.indexOf(course.days[i]);
    if (course.time === this.time) {
      return true;
    }
  }

  return false;
}


var me = new Student("matt","damon");
var al = new Course("algebra", "math", 34, ["mon", "wed", "fri"], 1);
var ca = new Course("calculus", "math", 8901, ["tues", "thurs", "fri"], 2);
// var en = new Course("japanese", "language", 250824509, ["mon", "wed"], 1);
me.enroll(al);
me.enroll(ca);
// me.enroll(en);

console.log(me.courseLoad());
console.log(al.students);
// console.log(al.conflictsWith(en));