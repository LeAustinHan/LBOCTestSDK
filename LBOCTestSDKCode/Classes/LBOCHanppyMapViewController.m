//
//  LBOCHanppyMapViewController.m
//  LBOCFirstDemo
//
//  Created by Han Jize on 2019/12/3.
//  Copyright © 2019 LBOC. All rights reserved.
//

#import "LBOCHanppyMapViewController.h"

#import "LBOCHappyLocationManager.h"

@interface LBOCHanppyMapViewController ()

@property (nonatomic, strong) MKMapView *mapView;/** 地图属性r */
@property (nonatomic, strong) CLLocationManager *locationManger;/** 定位管理对象 */
@property (nonatomic, strong) CLGeocoder *geocoder;/** 地理编码对象 */

@end

@implementation LBOCHanppyMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mapView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(5, 5, 60, 60);
    [button setTitle:@"<" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //查看手机定位服务是否开启
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"请在设置中打开定位服务");
        return;
    }
    //请确保有用户授权
    //重要,让地图显示当前用户的位置
    self.mapView.userTrackingMode = MKUserTrackingModeNone;
    //设置代理对象
    self.mapView.delegate = self;
}

- (void)buttonAction:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - 地图的代理方法
//这个方法就是地图控件根据标注模型信息创建大头针的方法
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //判断大头针标注模型是否是自定义模型
    if ([annotation isKindOfClass:[LBOCHappyMapAnnotation class]]) {
        //如果需要展示的模型确实是自定义模型
        //1.创建静态标识符
        static NSString *identifier = @"LBOCView";
        //2.去重用队列中取出可用的大头针对象
        MKPinAnnotationView *view = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        //3.判断是否可用
        if (view == nil) {
            view = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
        }
        //给大头针赋值
        view.annotation = annotation;
        
        //设置图片<需要赋的值>
        //MARK - 大头针有两种模式(父类:MKAnnotationView 子类:MKPinAnnotationView)
        //父类中的view,image 属性是有效的,在子类中无效, 代替大头针的图片
        
        //MARK - 动画属性和大头针�颜色属性属于子类属性, 父类中不可用
        //大头针是否从天而降
        view.animatesDrop = NO;
        
        //可以设置大头针的颜色
        if (@available(iOS 9.0, *)) {
            view.pinTintColor = [UIColor orangeColor];
        } else {
            // Fallback on earlier versions
        }
        //设置弹出标注模型的弹出框
        view.canShowCallout = NO;
        return view;
        
    }
    return nil;
}

#pragma mark - 规划路线
- (void)guideCurrentMapAnnotation:(LBOCHappyMapAnnotation *)currentMapAnnotation toTargetLocationInfo:(LBOCHappyMapAnnotation *)targetMapAnnotation{//打开系统地图App
    //使用地理编码把名字转成经纬度值
    [self.geocoder geocodeAddressString:currentMapAnnotation.title completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //取地标数组最后一项(假定服务器返回一个)
        CLPlacemark *startPlacemark = [placemarks firstObject];
        //创建大头针对象，设置属性；添加
        [self.mapView addAnnotation:currentMapAnnotation];
        CLLocationDegrees tlatitudeDelta = (targetMapAnnotation.coordinate.latitude - currentMapAnnotation.coordinate.latitude)*1.1;
        CLLocationDegrees tlongitude = (targetMapAnnotation.coordinate.longitude - currentMapAnnotation.coordinate.longitude)*1.1;
                                                       
        //设置起止点的中点为中心点
        CLLocationCoordinate2D centerCoordinate2D = CLLocationCoordinate2DMake((targetMapAnnotation.coordinate.latitude + currentMapAnnotation.coordinate.latitude)/2, (targetMapAnnotation.coordinate.longitude + currentMapAnnotation.coordinate.longitude)/2);
        [self.mapView setCenterCoordinate:centerCoordinate2D];
        //设置显示区域
        [self.mapView setRegion:MKCoordinateRegionMake(centerCoordinate2D, MKCoordinateSpanMake(tlatitudeDelta, tlongitude)) animated:YES];

        //一定写在block内部
        [self.geocoder geocodeAddressString:targetMapAnnotation.title completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            CLPlacemark *endPlacemark = [placemarks firstObject];
            [self.mapView addAnnotation:targetMapAnnotation];
            
            [self startRoute:startPlacemark withPlacemark:endPlacemark];
        }];
    }];
}

#pragma mark - 规划路线
- (void)startRoute:(CLPlacemark *)from withPlacemark:(CLPlacemark *)to {
    //开始路线请求
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    //选择出行模式
    request.transportType = MKDirectionsTransportTypeAutomobile;//自驾
    //设置路线的起点
    MKPlacemark *sourcePlace = [[MKPlacemark alloc]initWithPlacemark:from];
    request.source = [[MKMapItem alloc]initWithPlacemark:sourcePlace];
    //设置路线的终点
    MKPlacemark *destinationPlace = [[MKPlacemark alloc]initWithPlacemark:to];
    request.destination = [[MKMapItem alloc]initWithPlacemark:destinationPlace];
    //根据请求对象获取路线对象
    MKDirections *direction = [[MKDirections alloc]initWithRequest:request];
    //计算路线(路线由一条条路段组成.而路段由一个个的轨迹点组成)
    [direction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"总共有%lu条路线组成", response.routes.count);
        //填充轨迹点模型.
        for (MKRoute *route in response.routes) {
            [self.mapView addOverlay:route.polyline];
        }
    }];
}

#pragma mark -- 绘制路线的代理方法
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    //设置路线的颜色
    renderer.lineWidth = 5.0;
    renderer.strokeColor = [UIColor orangeColor];
    return renderer;
}

#pragma mark === lazy loading ===
//---给地理编码对象开空间
- (CLGeocoder *)geocoder {
    if (_geocoder == nil) {
        self.geocoder = [[CLGeocoder alloc]init];
    }
    return _geocoder;
}

@end
