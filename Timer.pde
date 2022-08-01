class Timer{
  int startTime;
  float period;
  
  Timer(float period){
    startTime = millis();
    this.period = period * 1000;
  }
  
  void restart(){
    startTime = millis();
  }
  
  boolean hasRunOut(){
    return (millis() - startTime > period);
  }
}
