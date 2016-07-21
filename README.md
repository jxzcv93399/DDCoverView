# DDCoverView
you can add a DDCoverView instance on top of a UITableView instance,when you slip on the coverView ,the tableView will scroll too.

  这是一个独立的UIView，你可以把它加在你的ViewController里，放置在tableview的头部，当tableview滑动的时候，coverview会相应变大变小。如果在coverview上滑动，其效果跟在列表上滑动一样。
  
  它与UITableView的headerView的区别是，在UITableView往上滑的时候有一个最终停留的状态，如果用UITableView的headerView，则会随着cell的滚动而消失在界面。
  
  同时它具备了headerView可滑动的特点（当然，看了代码之后你会发现实际上滑动事件仍然是由UITableView来响应，所以才会发生滚动）
  
  ![](https://github.com/tondyzhang/DDCoverView/raw/master/DDCoverView.gif)

代码：
在ViewController中
  ```objective-c
  //ViewController里初始化coverview
  self.coverView = [[CoverViewForDemo alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kCoverHeight)];
  [self.coverView registerTableView:self.tableView];
  [self.view addSubview:self.coverView];
  ```
在Coverview子类中
  ```objective-c
  //CoverViewForDemo是DDCoverView的一个子类
  //继承DDCoverView，在子类中添加上自己的子view，并且重写layoutSubview来控制subview的位置
  -(void)layoutSubviews
  {
    [super layoutSubviews];
    //avatar position
    self.avatar.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height - kAvatarCenterYToBottom);
    //avatar alpha
    float alpha = (self.bounds.size.height - self.heightToHideAvatar)/(self.defaultHeight - self.heightToHideAvatar);
    alpha = MIN(1, MAX(alpha, 0)); //0-1.0之间
    self.avatar.alpha = alpha;
    
    self.nickLabel.center = CGPointMake(self.bounds.size.width/2, CGRectGetMaxY(self.avatar.frame) + 10 + self.nickLabel.frame.size.height/2 );
    //上滑时让NickLabel停留在leftButton同一水平线上
    self.nickLabel.center = CGPointMake(self.nickLabel.center.x, MAX(self.leftButton.center.y, self.nickLabel.center.y));
  }
  ```
  具体实现细节请阅读代码
