function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
  return this.owner + " loves " + this.name + "."
}

Cat.prototype.cuteStatement = function () {
  return "Everyone loves " + this.name + "."
}

Cat.prototype.meow = function () {
  return "meow..";
}

var a = new Cat ("Matt", "Sam");
a.meow = function() { return "meowing.."; }

console.log(a.cuteStatement());
console.log(a.meow());
