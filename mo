from random import randint
import time,sys

# 玩家
class Player:

    def __init__(self,stoneNumber):
        self.stoneNumber = stoneNumber # 灵石数量
        self.warriors = {}  # 拥有的战士，包括弓箭兵和斧头兵

# 战士
class Warrior:

    # 初始化参数是生命值
    def __init__(self, strength):
        self.strength = strength

    # 用灵石疗伤
    def healing(self, stoneCount):
        # 如果已经到达最大生命值，灵石不起作用，浪费了
        if self.strength == self.maxStrength:
            return

        self.strength += stoneCount

        # 不能超过最大生命值
        if self.strength > self.maxStrength:
            self.strength = self.maxStrength


# 弓箭兵 是 战士的子类
class Archer(Warrior):
    # 种类名称
    typeName = '弓箭兵'

    # 雇佣价 100灵石，属于静态属性
    price = 100

    # 最大生命值 ，属于静态属性
    maxStrength = 100


    # 初始化参数是生命值, 名字
    def __init__(self, name, strength = maxStrength):
        Warrior.__init__(self, strength)
        self.name = name

    # 和妖怪战斗
    def fightWithMonster(self,monster):
        if monster.typeName== '鹰妖':
            self.strength -= 20
        elif monster.typeName== '狼妖':
            self.strength -= 80
        else:
            print('未知类型的妖怪！！！')



# 斧头兵 是 战士的子类
class Axeman(Warrior):
    # 种类名称
    typeName = '斧头兵'

    # 雇佣价 120灵石
    price = 120

    # 最大生命值
    maxStrength = 120


    # 初始化参数是生命值, 名字
    def __init__(self, name, strength = maxStrength):
        Warrior.__init__(self, strength)
        self.name = name

    # 和妖怪战斗
    def fightWithMonster(self,monster):
        if monster.typeName== '鹰妖':
            self.strength -= 80
        elif monster.typeName== '狼妖':
            self.strength -= 20
        else:
            print('未知类型的妖怪！！！')

# 鹰妖
class Eagle():
    typeName = '鹰妖'

# 狼妖
class Wolf():
    typeName = '狼妖'

# 森林
class Forest():
    def __init__(self,monster):
        # 该森林里面的妖怪
        self.monster = monster

print('''
***************************************
****           游戏开始             ****
***************************************

'''
)

# 森林数量
forest_num = 7

# 森林 列表
forestList = []
print(" 角色基本信息")
print(" 职业 :领主")
print(" 原石 :1000")
print("")
print("游戏规则！！！")
print("你将要通过7片森林，并且尽可能剩余较多的原石，最后剩余灵石越多越有机会当选国王！！")
print("你有十秒钟的时间记住森林的妖怪分布，在之后的行程中将不再提示")
print("请输入'是',开始游戏")
ok=input(":")
while ok !='是':
    print('请输入是否则无法进入游戏')
    ok = input(":")
print("")
# 为每座森林随机产生 鹰妖或者 狼妖
notification = '前方森林里的妖怪是：'  # 显示在屏幕上的内容
for i in range(forest_num):
    typeName = randint(0,1)
    if typeName == 0:
        forestList.append( Forest(Eagle()) )
    else:
        forestList.append( Forest(Wolf()) )

    notification += \
        f'第{i+1}座森林里面是 {forestList[i].monster.typeName}  '


print(notification,end='')
# 显示 妖怪信息
print("")
print("")
print("")

time.sleep(0)
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")
print("")


print('''
***************************************
弓箭兵（1）：                              斧头兵（2）：
    雇佣价： 100 灵石                          雇佣价： 120 灵石
    最大生命值： 100                           最大生命值： 120
    杀伤力                                    杀伤力 
        杀死鹰妖  ： 损耗生命值 20                    杀死鹰妖  ： 损耗生命值 80 
        杀死狼妖  :  损耗生命值 80                    杀死狼妖  :  损耗生命值 20
    
    
        
        
***************************************

'''
)
print("")
print("请选择佣兵/不少于一个(一次选择一个英雄，输入后回车即可，如果选择完成请输入8以进入下一步)")
print("输入战士对应编号：")
ok=input(":")
flag=0
playnum=[]
while(flag!=8 and stoneNumber>=0 ):
    print(">>")
    pn = int(input())
    flag = pn

    if (pn == 1 and player.stoneNumber >= 100):
        print("选择成功")
        print("原石-100")
        playnum.append(pn)
        player.stoneNumber = player.stoneNumber - 100
        print(f'原石剩余：{player.stoneNumber}')
    elif (pn == 2 and player.stoneNumber >= 120):
        print("选择成功")
        print("原石-120")
        playnum.append(pn)
        player.stoneNumber = player.stoneNumber - 120
        print(f'原石剩余：{player.stoneNumber}')
        print('如果您选择完毕，可输入8以进入游戏')
