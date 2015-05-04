## LCActionSheet
一个简约优雅的ActionSheet。微信和新浪微博也是采取类似的ActionSheet。

![image](https://github.com/LeoiOS/LCActionSheet/blob/master/LCActionSheetDemo.gif)

### 前言 Foreword
OK，这次我是看系统的UIActionSheet不爽。不能更改tintColor(蓝蓝的其实也还看得过去)就算了，风格还跟自己的App极为不搭。
然后看了看微信和新浪微博的ActionSheet，嗯，还不错。于是自己搞了个ActionSheet，并发扬大庇天下码农俱欢颜的精神，放上来给大家用:)

### 代码 Code
* 把LCActionSheet文件夹(在Demo中)拖到你的项目中。
* 在相应位置导入头文件: `#import "LCActionSheet.h"`，遵守协议`<LCActionSheetDelegate>`。
* 调用下面的方法即可:
  ```objc
  - LCActionSheet *sheet = [[LCActionSheet alloc] initWithTitle:@"你确定要注销吗？" buttonTitles:@[@"确定"] redButtonIndex:0 delegate:self];`
  - [sheet show];
  ```

* 监听方法(代理方法，可选实现):
  ```objc
  - (void)actionSheet:(LCActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex;
  ```
  
### 提示 Tips
- LCActionSheet是添加到当前的Window上，没适配横屏。
- 提供了title、buttons、redButton、cancelBtn这些杂七杂八的东东，应该全了。
- buttonIndex从上到下从0依次递增。如果不想有redButton，在`redButtonIndex:`处传个`-1`即可。
- 协议`<LCActionSheetDelegate>`能监听到点击的按钮的index，这个方法是可选实现的。

### 示例 Examples
![image](https://github.com/LeoiOS/LCActionSheet/blob/master/01.png)
![image](https://github.com/LeoiOS/LCActionSheet/blob/master/02.png)


### 联系 Support
* 发现问题请lssues我，谢谢:)
* Email:    leoios@sina.com
* Website:  http://www.leodong.com/ (备案中……)

### 授权 License
本项目采用 [MIT license](http://opensource.org/licenses/MIT) 开源，你可以利用采用该协议的代码做任何事情，只需要继续继承 MIT 协议即可。
