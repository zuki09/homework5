class Square {
  float x, y, r;
  //int c=(int)random(cols.length);
  boolean growing=true;

  //生成时，需要进行的东西，只执行一遍
  Square(float x_, float y_) {
    x=x_;
    y=y_;
    r=1;
  }

  void grow() {
    if (growing) {
      r+=0.05;//r小一点 控制圆的大小不要太不一致
    }
  }
  void show() {
    //x = round(random(width));
    //y = round(random(height));
    color c = img.get((int)x, (int)y);
    //color c=img.get((int)spots.x, (int)spots.y);
    fill(c);
    //noFill();
    //fill(cols[c]);
    noStroke();
    //ellipse(x, y, 2*r, 2*r);
    square(x,y,r);
  }
}
