//
//  ViewController.m
//  汽车品牌
//
//  Created by 黄宾宾 on 4/15/15.
//  Copyright (c) 2015 黄宾宾. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "CarGroup.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *groups;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.tableView.rowHeight=60;
    self.tableView.delegate=self;
    
}
#pragma mark 创建模型
-(NSArray*)groups{
    if (_groups==nil) {
        //初始化
        //获取pist的全路径
        NSString *path=[[NSBundle mainBundle]pathForResource:@"cars_total.plist" ofType:nil];
        //加载数组
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        //将数组中的所有字典转为模型对象，放到新的数组中
        NSMutableArray *groupArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            CarGroup *cargroup =[CarGroup carGroupWithDict:dict];
            [groupArray addObject:cargroup];
        }
        //赋值
        _groups=groupArray;
    }
    return _groups;
}

#pragma mark 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //根据section取出groups中的模型
    CarGroup *group=self.groups[section];
    //从groups模型中取出cars
    return group.cars.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义一个循环表示
    static NSString *ID=@"car";
    //从缓存池中取出可循环利用cell
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    //缓冲池中没有可循环利用的cell，就创建新的cell
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //设置数据
    CarGroup *group=self.groups[indexPath.section];
    Car *car=group.cars[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:car.icon];
    cell.textLabel.text=car.name;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CarGroup *group=self.groups[section];
    return group.title;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.groups valueForKeyPath:@"title"];
}


-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}










@end
