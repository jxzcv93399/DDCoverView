# DDCoverView
you can add a DDCoverView instance on top of a UITableView instance,when you slip on the coverView ,the tableView will scroll too.

  这是一个独立的UIView，你可以把它加在你的ViewController里，并配合UITableView来实现它的效果。
  
  它与UITableView的headerView的区别是，在UITableView往上滑的时候有一个最终停留的状态，如果用UITableView的headerView，则会随着cell的滚动而消失在界面。
  
  同时它具备了headerView可滑动的特点（当然，看了代码之后你会发现实际上滑动事件仍然是由UITableView来响应，所以才会发生滚动）
