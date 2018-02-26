#include <stdio.h>
#include <iostream>

class A { 
public: 
  virtual void p() {
    cout << “A.p” << endl;
  } 
  void q() {
    cout << “A.q” << endl;
  }
  virtual void r() {
    p();
    q();
  } 
}; 
class B : public A { 
public: 
  void p() { 
    cout << “B.p” << endl;
  } 
}; 
class C : public B {
public: 
  void q() {
    cout << “C.q” << endl;
  }
  void r() {
    p();
    q();
  } 
};

int main() {
  
  return 0;
}
