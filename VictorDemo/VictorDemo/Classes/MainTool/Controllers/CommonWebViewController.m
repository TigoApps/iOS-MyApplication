//
//  CommonWebViewController.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/8/10.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonWebViewController.h"
#import <WebKit/WebKit.h>
#import "WKCookieSyncManager.h"

@interface CommonWebViewController ()<WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate>

@property(nonatomic, strong) WKWebView *webView;
@property(nonatomic, strong) UIProgressView *progressView;

@end

@implementation CommonWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"estimatedProgress"];
}

/**
 *  设置子控件
 */
-(void)setUpChildViews
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    //清理缓存
    [self onCleanCatch];
    //webView加入到view中
    [self.view addSubview:self.webView];
    [self.webView addSubview:self.progressView];
    
    NSURL *url = [NSURL URLWithString:@"http://www.hao123.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    WS(weakSelf);
    //添加约束
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(64);
        make.left.and.right.mas_equalTo(0);
    }];
    
    //添加监听加载进度
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark -- 清理缓存
-(void)onCleanCatch
{
    NSString *libraryDir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSString *webkitFolderInLib = [NSString stringWithFormat:@"%@/WebKit",libraryDir];
    NSString *webKitFolderInCaches = [NSString stringWithFormat:@"%@/Caches/%@/WebKit",libraryDir,bundleId];
    NSString *webKitFolderInCachesfs = [NSString stringWithFormat:@"%@/Caches/%@/fsCachedData",libraryDir,bundleId];
    NSError *error;
    /* iOS8.0 WebView Cache的存放路径 */
    [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCaches error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:webkitFolderInLib error:nil];
    /* iOS7.0 WebView Cache的存放路径 */
    [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCachesfs error:&error];
}

#pragma mark -- kvo
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([@"estimatedProgress" isEqualToString:keyPath]) {
        //显示进度
        self.progressView.alpha = 1.0;
        [self.progressView setProgress:[self.webView estimatedProgress] animated:YES];
        if ([self.webView estimatedProgress] >= 1.0) {
            [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.progressView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0];
            }];
        }
    }
}

#pragma mark -- WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
}

#pragma mark -- WKNavigationDelegate
//加载完成
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
}

//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //MMSLog(@"%s", __FUNCTION__);
}

//内容返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

//加载失败时候调用
-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    //MMSLog(@"%s", __FUNCTION__);
}


#pragma mark -- 懒加载
-(WKWebView *)webView
{
    if (!_webView) {
        //设置共享Cookies
        WKCookieSyncManager *cookiesManager = [WKCookieSyncManager sharedCookieSyncManager];
        WKWebViewConfiguration *configuretion = [[WKWebViewConfiguration alloc] init];
        configuretion.processPool = cookiesManager.processPool;
        configuretion.preferences = [[WKPreferences alloc] init];
        configuretion.preferences.minimumFontSize = 10;
        configuretion.preferences.javaScriptEnabled = YES;
        configuretion.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        configuretion.userContentController = [[WKUserContentController alloc] init];
        //js注入(注入cookiess)
        NSString * source = @"";
        WKUserScript *script = [[WKUserScript alloc] initWithSource:source injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
        [configuretion.userContentController addUserScript:script];
        [configuretion.userContentController addScriptMessageHandler:self name:@"amnice"];
        
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuretion];
        //设置代理
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        [_webView sizeToFit];
        _webView.backgroundColor = [UIColor lightGrayColor];

    }
    return _webView;
}

-(UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        [_progressView setTrackTintColor:[UIColor clearColor]];
        _progressView.progressTintColor = [UIColor greenColor];
    }
    return _progressView;
}

@end
