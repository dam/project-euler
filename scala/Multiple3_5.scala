object Multiple3_5 extends App {
  def multipleLoop(n : Int) : Int = {
    var result = 0
    for(x <- 1 to n) {
      if ((x % 3 == 0) || (x % 5 == 0)) {
      	result += x
      }	
    }
    result
  }

  def multipleFunctional(n: Int) = {
  	val multiples = for (x <- 1 to n if ((x % 3 == 0) || (x % 5 == 0))) yield x
  	multiples.reduce(_ + _)
  }

  val s1 = System.nanoTime
  val result = multipleLoop(1000)
  val time1 = (System.nanoTime-s1)/1e6
  println(s"Result with loop: $result in $time1 ms")


  println("Functional implementation:")
  val s2 = System.nanoTime
  val result2 = multipleFunctional(1000)
  val time2 = (System.nanoTime-s2)/1e6
  println(s"Result with loop: $result2 in $time2 ms")	
}