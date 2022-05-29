+++
title = "python 速成"
author = ["Ernest Dong"]
date = 2022-05-27T00:00:00+08:00
tags = ["python"]
draft = false
+++
## python 安装

### 安装 python

安装包分别在 [Windows](https://www.python.org/downloads/windows/) [mac](https://www.python.org/downloads/macos/)，记得下载 python **3** 而不是 python 2，安装时记得勾选“add python to path”![“add python to path”](/images/2022-05-27-12-38-48.png)

### 安装 vscode (optional)

用来写 python 程序，在 [这里](https://code.visualstudio.com/) 下载，下载完成后打开插件面板安装 python、pylance、jupyter 三个插件

![vscode插件](/images/2022-05-27-12-48-34.png)

## python 基础

### 运算

```python
# #开头的是注释
# = 表示给左边变量赋值
a = 1
b = 2
c = 1
# 加减乘除用 +-*/表示，乘号不能省略，乘方用 ** 表示
print(b ** 2 - 4 * a * c) # print 输出到屏幕上 0
# 逻辑运算
# |大于|小于|等于|不等于|
# | >  | <  | == | !=   |
print(a > b) # True
```

### 流程控制

python 用缩进表示代码的嵌套，缩进要么为 4/8 个空格，要么为一个 tab(键盘 <kbd>Q</kbd> 左侧)

条件用 `if`，循环用 `for`/`while`

```python
if (2 == 1):
    print("相等")
    print("2==1")
else:
    print("2!=1")
    print("不相等")

n = 0
for i in range(1,100): # range(start, end, step) 表示左开右闭的序列，默认间隔 step 为 1
    n += i
while n > 0:
    n = n - 1
```

## 函数

可复用的代码可以定义为函数，函数可以理解为接受若干个形参，返回一个返回值的结构体。

```python
def add_one(x): # 参数 x 指代 add_one 函数接收的变量
    x = x + 1 # 在函数内部我们实现一些可复用的逻辑
    return x # 返回值为 x，将结果返回给调用者，如果没有此句默认返回特殊值 None

# 形参在函数体外面访问不到
# print(x) 报错
a = 1
b = add_one(a)
print(b)
```

调用函数即可复用我们的逻辑

## 面向对象

python 中 “一切皆对象”，函数、运算符、内置数据类型、我们自定义的类型，都是一种“对象”。
对象具有属性和方法，可以通过 `.` 来访问。通过对象我们可以生成特定的数据结构，绑定特定的算法。
对象将数据和数据对应的操作绑定在了一起

```python
dictionary = {"a":1} # 一个字典对象赋值给了 dictionary 变量
print(dictionary.keys()) # 调用 `keys` 方法，获得字典里面的键
```

### class

我们要模拟测核酸排队，许多人来排队，先来的先测。即我们希望利用一个对象来实现如下的效果：

```python
queue = Queue("董晨阳","Ernest") # 实例化对象 queue，排队最初有两个人：董晨阳和 Ernest
queue.add("Dong") # Dong 来排队
# queue.insert("someone") # 不能插队，即内部保存的数据不能有任何方式修改顺序
queue.pop() # 返回出董晨阳，董晨阳测完核酸
queue.pop() # 返回出 Ernest， Ernest 测完核酸
queue.pop() # 返回出 Dong， Dong 测完核酸
```

为了实例化一个对象，我们需要定义一个更加抽象的类，类的定义方式为 `class 类名:`，类中有一个特殊的方法(函数) `__init__`，定义了对象在创建时的操作

> python 在创建类时，类中每一个定义的 “函数” 都会建立在类的空间中，然后将这些方法绑定到类上，因而会有所谓的 `def 方法名(xxx):`， 和定义函数长得一样。方法中的第一个参数 `self` 会绑定到对象“自身”，即用 `self` 指代我们实例化的 `queue`

类的其他“方法”一如定义函数，只不过我们需要额外传递一个形参 `self` 指代实例化后的对象

```python
class Queue:
    def __init__(self, *args): # *args 表示我们接受“多个”参数，详见 内置对象的 tuple
        self._queue=list(args) # 实例化的 queue 有一个 queue.__queue属性，其他人看不到

    def add(self, name): # add 是一个方法，实例化对象可使用这个方法修改属性 __queue
        self._queue.append(name) # 见内置对象的 list

    def pop(self):
        name = self._queue.pop(0) # 见内置对象的 list
        return name
```

别人写好的类我们可以“继承”，继承的子类可以使用父类的方法，拥有父类的属性，继承的语法为`class 子类(父类):`，例如上面的排队类为了更贴合测核酸，我们要加入“捅”的动作

```python
class MyQueue(Queue):
    def __init__(self,*args):
        super().__init__(*args) # super() 返回的是父类，此句含义为父类初始化了，此时有了 _queue 属性
        print("准备测核酸了") # 我们还可以赋予更多属性
    def 捅(self):
        name =  self.pop() # 继承不仅得到了 pop 方法，还可以有新的方法
        print(name, "在测核酸")
queue = MyQueue("张三", "李四", "王五")
queue.add("赵六")
queue.捅()
```

python 中的一切，函数、运算符+-*/、内置数据类型、我们自定义的类型、以及类本身，都是一种“对象”。

### 内置对象

python 有一些常用的内置的对象

- 整数`int`，浮点数(可以理解为小数)`float`，字符串(用成对单/双引号包裹)`str`
- `list` 为一个有顺序的列表，如 `[1,2,3,4,"5"]` 表示一个列表里面有 1、2、3、4 四个 `int` 类型的变量和 `"5"` 这个 `str` 类型的变量，可以 `append` 追加新的对象，可以 `pop(n)` 删除掉第 n 个对象，注意 python 的“第一个”索引是 0 ，是从 0 开始的
- `dict` 保留一个键值对，如 `dictionary={1:2,"key":"value"}`，访问 `dictionary["key"]` 获得 `"value"`，可以通过 `keys()`方法获取到所有键，`values()` 方法获取到所有值
- `set` 是一个无序无重复项的集合，`set([1,1,"1"])` 将`[1,1,"1"]`的列表转换成元素为 `1` 和 `"1"`的集合
- `tuple` 是一个不可变的“列表”，我们能利用索引获得 tuple 中的值，但无法增删改 tuple 的值
