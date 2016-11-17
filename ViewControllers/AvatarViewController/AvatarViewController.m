//
//  AvatarViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/30.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "AvatarViewController.h"
#import <MBProgressHUD.h>
#import <Masonry.h>

@interface AvatarViewController ()<UIScrollViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate> {
    UIScrollView * _scrollView;
    UIImageView * _avatarImageView;
    UIAlertController * _alertController;
    UIImagePickerController * _pickerController;
    UIImage * _pickImage;
    MBProgressHUD * _mbpHud;
}

@end

@implementation AvatarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar .hidden = YES;
    self.edgesForExtendedLayout = NO;
    self.title = @"头像";
    [self setRightItem];
    // Do any additional setup after loading the view from its nib.
    [self setScrollView];
    [self setupAlertController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setRightItem 
- (void)setRightItem {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"RightItem"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
}

- (void)clickRightItem {
    // 弹出alertController
    [self presentViewController:_alertController animated:YES completion:^{
        
    }];
}

#pragma mark - alertController Settings
- (void)setupAlertController {
    _alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    UIAlertAction * cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了拍照");
        _pickerController = [[UIImagePickerController alloc]init];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            _pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            _pickerController.delegate = self;
            _pickerController.allowsEditing = YES;
        }
        [self presentViewController:_pickerController animated:YES completion:nil];
    }];
    UIAlertAction * picAlbumAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _pickerController = [[UIImagePickerController alloc]init];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            _pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            _pickerController.delegate = self;
            _pickerController.allowsEditing = YES;
        }
        [self presentViewController:_pickerController animated:YES completion:nil];
        NSLog(@"点击了相册");
    }];
    [_alertController addAction:cancelAction];
    [_alertController addAction:cameraAction];
    [_alertController addAction:picAlbumAction];
}

#pragma mark - imagePicker delegate 
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [_pickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark - imagepicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // 选择完成策略  直接上传.
    [picker dismissViewControllerAnimated:YES completion:nil];
    _mbpHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _mbpHud.mode = MBProgressHUDModeIndeterminate;
    _mbpHud.labelText = @"正在上传";
    _pickImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    NSData * imageData = UIImageJPEGRepresentation(_pickImage, 1);
    [[NSUserDefaults standardUserDefaults]setObject:imageData forKey:@"AvatarData"];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        _avatarImageView.image = _pickImage;
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    });
}

#pragma mark - scrollview delegate & setScrollView
- (void)setScrollView {
    _scrollView = [[UIScrollView alloc]init];
    [self.view addSubview:_scrollView];
    //设置约束
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0.0f);
        make.right.equalTo(self.view.mas_right).offset(0.0f);
        make.bottom.equalTo(self.view.mas_bottom).offset(0.0f);
        make.top.equalTo(self.view.mas_top).offset(0.0f);
    }];
    
    _scrollView.bouncesZoom = YES;
    _scrollView.maximumZoomScale = 2.5f;
    _scrollView.minimumZoomScale = 1.0f;
    _scrollView.multipleTouchEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.canCancelContentTouches = YES;
    _scrollView.clipsToBounds = YES;
    _scrollView.backgroundColor = [UIColor blackColor];
    [self setImageView];
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _avatarImageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGFloat offsetX = (_scrollView.frame.size.width > _scrollView.contentSize.width) ? (_scrollView.frame.size.width - _scrollView.contentSize.width)*0.5:0.0;
    CGFloat offsetY = (scrollView.frame.size.height > scrollView.contentSize.height) ? (scrollView.frame.size.height - scrollView.contentSize.height)*0.5:0.0;
    _avatarImageView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX, scrollView.contentSize.height * 0.5 + offsetY - 50);
}

#pragma mark - setImageView
- (void)setImageView {
    _avatarImageView = [[UIImageView alloc]init];
    [_scrollView addSubview:_avatarImageView];
    _avatarImageView.clipsToBounds = YES;
    _avatarImageView.userInteractionEnabled = YES;
    _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    _avatarImageView.image = [UIImage imageNamed:@"XXXXX"];
    //计算宽度、高度
    CGRect winSize = [[UIScreen mainScreen]bounds];
    CGFloat imageWidth = winSize.size.width;
    //添加约束
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_scrollView);
        make.size.mas_equalTo(CGSizeMake(imageWidth, imageWidth));
    }];
}

#pragma mark - setTapGesture 
- (void)setTapGesture {
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tapGesture.numberOfTapsRequired = 2;
    _scrollView.userInteractionEnabled = YES;
    [_scrollView addGestureRecognizer:tapGesture];
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    if (_scrollView.zoomScale > 1.0) {
        [_scrollView setZoomScale:1.0 animated:YES];
    }else {
        CGPoint touchPoint = [tap locationInView:_avatarImageView];
        CGFloat newZoomScale = _scrollView.maximumZoomScale;
        CGFloat xSize = self.view.frame.size.width / newZoomScale;
        CGFloat ySize = self.view.frame.size.height / newZoomScale;
        [_scrollView zoomToRect:CGRectMake(touchPoint.x - xSize / 2, touchPoint.y - ySize / 2, xSize, ySize) animated:YES];
    }
}

@end
