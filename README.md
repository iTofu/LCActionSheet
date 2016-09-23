# LCActionSheet

[![Travis](https://img.shields.io/travis/iTofu/LCActionSheet.svg?style=flat)](https://travis-ci.org/iTofu/LCActionSheet)
[![CocoaPods](https://img.shields.io/cocoapods/v/LCActionSheet.svg)](http://cocoadocs.org/docsets/LCActionSheet)
[![CocoaPods](https://img.shields.io/cocoapods/l/LCActionSheet.svg)](https://raw.githubusercontent.com/iTofu/LCActionSheet/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/LCActionSheet.svg)](http://cocoadocs.org/docsets/LCActionSheet)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](http://leodev.me)

☀️ 一款简约而不失强大的 ActionSheet，微信和微博都采取了极其类似的样式。

![LCActionSheet](https://raw.githubusercontent.com/iTofu/LCActionSheet/master/LCActionSheetDemo.gif)

```
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
```

欢迎访问 **[我的博客](http://LeoDev.me)**：http://LeoDev.me


## 介绍 Introduction

☀️ 一款简约而不失强大的 ActionSheet，微信和微博都采取了极其类似的样式。

* iOS 7.0 +，Demo 需要 [CocoaPods](https://cocoapods.org/) 环境运行。

* 格调高雅，风格百搭，怎么看怎么舒服。

* 高度自定义，可能需要自定义的基本都考虑到了。详见 [LCActionSheet.h](https://github.com/iTofu/LCActionSheet/blob/master/LCActionSheet/LCActionSheet.h) Properties 部分。

* 有代理，有 Block，可类方法，可实例方法，想怎样，就怎样。

* 代理、Block 非常完善，从 will 到 did 都有，详见 [LCActionSheet.h](https://github.com/iTofu/LCActionSheet/blob/master/LCActionSheet/LCActionSheet.h) Delegate & Block 部分。

* 重要注释完整，代码风格良好，满满的善意，便于阅读源码，照顾强迫症，拓展更多功能请前往 [PR](https://github.com/iTofu/LCActionSheet/pulls)。三个诸葛亮，顶个好工匠。

* 集百家之长，使用 [Masonry](https://github.com/SnapKit/Masonry) 进行布局，感谢 [Masonry](https://github.com/SnapKit/Masonry)。

* 支持 iPad，支持横屏，支持竖屏，支持一会横屏一会竖屏，理论上支持无数个按钮，统统支持。

* 有骨气。我就不改状态栏颜色，我就是这么刚。

* 系统的 UIActionSheet，弱爆了。

> 💬 **告示**
> 
> 英文还不错时间又充裕的同学可以帮我翻译出 README 的英文版，我好往 [CocoaControls](https://www.cocoacontrols.com/) 上扔啊~
>
> 可白文翻译，使用 [Markdown](http://www.appinn.com/markdown/) 编辑更佳！义务的哦，如果翻译用心的话我个人请你喝杯咖啡 ☕️！
> 
> 直接 [PR](https://github.com/iTofu/LCActionSheet/pulls) 或者发我邮箱：devtip@163.com 都可！

## 代码 Code

* 两种导入方法：

  - 方法一：[CocoaPods](https://cocoapods.org/)：`pod 'LCActionSheet'`

  - 方法二：直接把 LCActionSheet 文件夹（在 Demo 中）拖拽到你的项目中

* 在相应位置导入头文件：`#import "LCActionSheet.h"`，遵守协议 `<LCActionSheetDelegate>`

* 调用列的任意方法即可：

  1. 默认样式，迅速搞定

    ```objc
    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"Default LCActionSheet"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", nil];
    [actionSheet show];
    ```

  2. 可自定义项，[LCActionSheet.h](https://github.com/iTofu/LCActionSheet/blob/master/LCActionSheet/LCActionSheet.h) 有完整注释

    ```objc
    LCActionSheet *actionSheet     = [[LCActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", @"Button 4", @"Button 5", nil];
    actionSheet.title              = @"This is a very very very very very very very very very very very very very very very very very very very very very very very very very very very long title~";
    actionSheet.cancelButtonTitle  = @"Close";
    [actionSheet appendButtonTitles:@"Button 6", @"Button 7", nil];
    actionSheet.titleColor         = [UIColor orangeColor];
    actionSheet.buttonColor        = [UIColor greenColor];
    actionSheet.titleFont          = [UIFont boldSystemFontOfSize:15.0f];
    actionSheet.buttonFont         = [UIFont boldSystemFontOfSize:15.0f];
    actionSheet.buttonHeight       = 60.0f;
    actionSheet.scrolling          = YES;
    actionSheet.visibleButtonCount = 3.6f;
    actionSheet.darkViewNoTaped    = YES;
    actionSheet.unBlur             = YES;
    actionSheet.blurEffectStyle    = UIBlurEffectStyleLight;
    
    // V 2.1.0 use `destructiveButtonIndexSet` instead of `redButtonIndexSet`.
    actionSheet.destructiveButtonIndexSet = [NSSet setWithObjects:@0, @2, nil];
    actionSheet.destructiveButtonColor    = [UIColor blueColor];
    
    [actionSheet show];
    ```

  3. Block

    ```objc
    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"Block LCActionSheet" cancelButtonTitle:@"Cancel" clicked:^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        
        NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
        
    } otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", @"Button 4", @"Button 5", @"Button 6", nil];
    
    actionSheet.scrolling          = YES;
    actionSheet.visibleButtonCount = 3.6f;
    
    actionSheet.willPresentBlock = ^(LCActionSheet *actionSheet) {
        NSLog(@"willPresentActionSheet");
    };
    
    actionSheet.didPresentBlock = ^(LCActionSheet *actionSheet) {
        NSLog(@"didPresentActionSheet");
    };
    
    actionSheet.willDismissBlock = ^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"willDismissWithButtonIndex: %d", (int)buttonIndex);
    };
    
    actionSheet.didDismissBlock = ^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"didDismissWithButtonIndex: %d", (int)buttonIndex);
    };
    
    [actionSheet show];
    ```

  4. Delegate，可选实现

    ```objc
    #pragma mark - LCActionSheet Delegate

    - (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
        NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
    }

    - (void)willPresentActionSheet:(LCActionSheet *)actionSheet {
        NSLog(@"willPresentActionSheet");
    }

    - (void)didPresentActionSheet:(LCActionSheet *)actionSheet {
        NSLog(@"didPresentActionSheet");
    }

    - (void)actionSheet:(LCActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
        NSLog(@"willDismissWithButtonIndex: %d", (int)buttonIndex);
    }

    - (void)actionSheet:(LCActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
        NSLog(@"didDismissWithButtonIndex: %d", (int)buttonIndex);
    }
    ```


## 版本 Release

### V 2.5.2 (2016.09.23)

* 修复一个影响用户体验的效果，详见：[Issue 25](https://github.com/iTofu/LCActionSheet/issues/25)。

* 完善剩下的部分注释，主要是 Block 部分。


### V 2.5.1 (2016.09.08)

* 修复一个更换字体失效的 Bug。


### V 2.5.0 (2016.09.05 ⚠️ 属性名变化)

* 添加 `cancenButtonIndex` 属性。在 `cancelTitle.length > 0` 的情况下始终返回 `0`，否则返回 `-1`：

  ```objc
  @interface LCActionSheet : UIView

  @property (nonatomic, assign, readonly) NSInteger cancelButtonIndex;
  ```

* 修改 Block 属性命名：

  ```objc
  @property (nonatomic, copy) LCActionSheetClickedBlock     clickedBlock;
  @property (nonatomic, copy) LCActionSheetWillPresentBlock willPresentBlock;
  @property (nonatomic, copy) LCActionSheetDidPresentBlock  didPresentBlock;
  @property (nonatomic, copy) LCActionSheetWillDismissBlock willDismissBlock;
  @property (nonatomic, copy) LCActionSheetDidDismissBlock  didDismissBlock;

  ->

  @property (nonatomic, copy) LCActionSheetClickedHandle     clickedHandle;
  @property (nonatomic, copy) LCActionSheetWillPresentHandle willPresentHandle;
  @property (nonatomic, copy) LCActionSheetDidPresentHandle  didPresentHandle;
  @property (nonatomic, copy) LCActionSheetWillDismissHandle willDismissHandle;
  @property (nonatomic, copy) LCActionSheetDidDismissHandle  didDismissHandle;
  ```


### V 2.3.3 (2016.08.16)

* 修复设置 `actionSheet.unBlur = YES;` 后背景透明的 Bug。

* 完善注释，移除无用类。


### V 2.3.2 (2016.08.16)

* 可以自定义 blurEffectStyle：

  ```objc
  @property (nonatomic, assign) UIBlurEffectStyle blurEffectStyle;
  ```


### V 2.3.1 (2016.08.15)

* 静态渲染模糊改为模糊蒙板。


### V 2.3.0 (2016.08.11)

* 重新实现 V 1.x 的方法，允许使用数组而不必须是多参数来设置按钮标题：

  ```objc
  #pragma mark Delegate

  + (instancetype)sheetWithTitle:(NSString *)title
                        delegate:(id<LCActionSheetDelegate>)delegate
               cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitleArray:(NSArray *)otherButtonTitleArray;

  - (instancetype)initWithTitle:(NSString *)title
                       delegate:(id<LCActionSheetDelegate>)delegate
              cancelButtonTitle:(NSString *)cancelButtonTitle
          otherButtonTitleArray:(NSArray *)otherButtonTitleArray;


  #pragma mark Block

  + (instancetype)sheetWithTitle:(NSString *)title
               cancelButtonTitle:(NSString *)cancelButtonTitle
                         clicked:(LCActionSheetClickedBlock)clickedBlock
           otherButtonTitleArray:(NSArray *)otherButtonTitleArray;

  - (instancetype)initWithTitle:(NSString *)title
              cancelButtonTitle:(NSString *)cancelButtonTitle
                        clicked:(LCActionSheetClickedBlock)clickedBlock
          otherButtonTitleArray:(NSArray *)otherButtonTitleArray;
  ```

* 优化一些 UI 效果，主要是高亮状态的效果。


### V 2.2.0 (2016.07.27)

* 添加高斯模糊效果（可选），[Issue 19](https://github.com/iTofu/LCActionSheet/issues/19) by [guanzhendong](https://github.com/guanzhendong)。


### V 2.1.1 (2016.07.19)

* 完善部分注释，注明需要注明的属性的默认值。


### V 2.1.0 (2016.07.19)

* 新增自定义项，[Issue 18](https://github.com/iTofu/LCActionSheet/issues/18) by [IAMJ](https://github.com/IAMJ)：

  ```objc
  destructiveButtonColor // 警示按钮颜色
  ```

* 修改一个属性命名：

  ```objc
  // 与 UIActionSheet 命名保持一致，便于顺手敲出
  // V 2.1.0 给予 redButtonIndexSet 过期警告，下一版本将会移除该属性
  redButtonIndexSet -> destructiveButtonIndexSet
  ```

### V 2.0.0 (2016.07.16, ⚠️ Important)

* 彻底重构整个项目，满足目前收到的所有需求，功能只多不少，依然 [MIT](http://opensource.org/licenses/MIT) 共享。

* 现已加入 [Masonry](https://github.com/SnapKit/Masonry) 豪华套餐。


### V 1.2.3 (2016.04.05)

* 更新 CocoaPods 源地址。


### V 1.2.0 (2016.03.07)

* 合并 [PR](https://github.com/iTofu/LCActionSheet/pull/14) by [apache2046](https://github.com/apache2046)，致谢！

  > Swift bug fixed
  >
  > mainBundle 这种方法无法在将 LCActionSheet 作为 Framework 时正确找到资源包路径


### V 1.1.5 (2016.02.17)

* 合并 [PR](https://github.com/iTofu/LCActionSheet/pull/11) by [nix1024](https://github.com/nix1024)，致谢！

  > Add background opacity & animation duration option
  >
  > 添加暗黑背景透明度和动画持续时间的设定


### V 1.1.3 (2015.12.16)

* 合并 [PR](https://github.com/iTofu/LCActionSheet/pull/9) by [zachgenius](https://github.com/zachgenius)，致谢！

  > 增加了一些功能实现，如增加自定义添加按钮的方法，增加按钮本地化，增加自定义按钮颜色，并且优化逻辑。

* V 1.1.2 被怪物吃掉了！👹


### V 1.1.1 (2015.12.09)

* 标题支持最多两行。两行时会适当调整标题的背景高度。


### V 1.1.0 (2015.12.07)

* 要 Block？满足你！

* 优化逻辑：创建 ActionSheet 时，不再添加到 window 上。


### V 1.0.6 (2015.11.09)

* 添加对 [CocoaPods](https://cocoapods.org/) 的支持：

  ```objc
  pod 'LCActionSheet'
  ```


### V 1.0.0 (2015.05.08)

* 修复：新添加的 \_backWindow 在某些情况下导致界面无反应的BUG。——by [kuanglijun312](https://github.com/kuanglijun312)

* 修复：当 StatusBarStyle 为 UIStatusBarStyleLightContent 时，背景不会遮挡 statusBar 的问题。——by [陈威](https://github.com/weiwei1035)


### V 1.0.0 pre (2015.05.05)

* 增加了类方法，可以通过类方法实例化 actionSheet。

* 完善部分注释。



## 提示 Tips

* LCActionSheet 添加到 KeyWindow 上，已适配横屏。

* 可自定义 title、buttons、destructiveButtons、cancelButton、titleColor、titleFont、buttonColor、buttonFont、canScrolling 等等，详见 [LCActionSheet.h](https://github.com/iTofu/LCActionSheet/blob/master/LCActionSheet/LCActionSheet.h)。

* 点击的 buttonIndex 按 UIAlertView 的逻辑来即可，若有取消按钮则取消按钮为 0，其他从上至下递增。

* scrolling 属性控制按钮过多时，是否可以滚动，默认 NO，不可滚动。visibleButtonCount 属性控制可见的按钮个数，可以是小数，必须先设置 scrolling = YES 才生效。tableView 的 scrollsToTop 属性依然可用，可点击状态栏快速滚回顶部。



## 鸣谢 Thanks

* [Masonry](https://github.com/SnapKit/Masonry)

* 海纳百川，有容乃大。感谢开源社区和众攻城狮的支持！感谢众多 [Issues](https://github.com/iTofu/LCActionSheet/issues) 和 [PR](https://github.com/iTofu/LCActionSheet/pulls)！更期待你的 [PR](https://github.com/iTofu/LCActionSheet/pulls)！


## 示例 Examples

![LCActionSheet](https://raw.githubusercontent.com/iTofu/LCActionSheet/master/LCActionSheetDemo01.png)

---

![LCActionSheet](https://raw.githubusercontent.com/iTofu/LCActionSheet/master/LCActionSheetDemo02.png)

---

![LCActionSheet](https://raw.githubusercontent.com/iTofu/LCActionSheet/master/LCActionSheetDemo03.png)


## 联系 Support

* 有问题请前往 [New Issue](https://github.com/iTofu/LCActionSheet/issues/new)，谢谢 :)

* Mail: devtip@163.com

* Blog: http://LeoDev.me

* 如果你觉得我的项目对你有所帮助，想要进行一些捐赠的话，我也很感谢！👇

  ![Leo](http://7xl8ia.com1.z0.glb.clouddn.com/alipay.png)



## 授权 License

本项目采用 [MIT license](http://opensource.org/licenses/MIT) 开源，你可以利用采用该协议的代码做任何事情，只需要继续继承 MIT 协议即可。

