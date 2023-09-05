# Pandas

Pandas库是一个流行的Python数据处理和分析库，它提供了用于处理和操作数据的强大工具和数据结构。Pandas的核心数据结构包括Series（序列）和DataFrame（数据框），它们使数据的读取、清理、转换和分析变得更加容易。

## 导入Pandas

- 安装pandas
```py
!pip install pandas -i https://pypi.tuna.tsinghua.edu.cn/simple
```
- 导入pandas
```
import pandas as pd
```


## Series
在 pandas 中，Series 是一种一维的带标签的数组状数据结构。

我们首先以4个数创建一个Series，并命名为 `my series`。

```py
s = pd.Series([1,2,3,4], name = 'my series')
```
`pd.Series()`中不指定index（索引）参数时，默认为0，1，... 开始的index，也就是该数组的标签。

- Series 支持计算操作。

  ```py
  s * 100
  ```
- Series 支持描述性统计，descibe函数会显示最基本的统计量，包括count计数、平均值、标准差、最小值，25%分位数，50%分位数，75%分位数和最大值。
  
  ```py
  s.describe()
  ```

- Series 的索引很灵活。
  
  ```py
  s.index = ['number1','number2','number3','number4']
  ```
  这时，Series就像一个`python`中的`dict（字典）`元素，可以使用一样的语法，其中`index`相当于`dict`的`key（键）`。
  
  >例：使用`[]`操作符访问 index 对应的值。

    ```py
    s['number1']
    ```

  
  >例：使用 `<index>in<series>` 表达式判断 index 是否在Series中.
    ```py
    'number1' in s
    ```


## DataFrame

`DataFrame`本质上是`Series`的集合，包含多列，每个变量对应一列，类似于高度优化的Excel表格。因此，它是一个强大的工具，用于表示和分析自然组织成行和列的数据，通常为单个行和单个列提供描述性索引。

### 创建DataFrame
`DataFrame`可以来自列表、字典、文件等。

- 基于列表创建
```py
names = ['Alice', 'Bob', 'Charlie']
ages = [25, 30, 22]
cities = ['New York', 'San Francisco', 'Los Angeles']
data = {'Name': names, 'Age': ages, 'City': cities}
df = pd.DataFrame(data)
```

- 基于字典创建
```py
data = {'Column1': [value1, value2, ...], 'Column2': [value1, value2, ...]}
df = pd.DataFrame(data)
```

- 基于文件创建（对于不同类型的文件，使用不同的函数）
```py
df =  pd.read_csv('csv文件的绝对路径')
df =  pd.read_excel('excel文件的绝对路径')
df =  pd.read_table('txt文件的绝对路径', delimiter='\t') #delimiter参数指定数据分隔符，可以为换行符`\t`，也可以为`,`等
```
>注：pd.read_csv默认分隔符为逗号，pd.read_table默认分隔符为换行符。它们还支持许多其他参数，可以使用`help()`函数查看。  
  >例：help(pd.read_csv)


### 查看数据

```py
df.head(n)
df.tail(n)
```
`.head`函数可以指定查看前n行；`.tail`函数指定查看后n行。

```py
df.info()
```
`.info`函数可以查看数据基本信息，包括字段类型和非空值计数。

### 数据切片

实际中，我们常常想要选取感兴趣的数据子集。

以 https://www.rug.nl/ggdc/productivity/pwt/pwt-releases/pwt-7.0 中的部分数据为例，读取为df。
<table>
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>country</th>
      <th>country isocode</th>
      <th>year</th>
      <th>POP</th>
      <th>XRAT</th>
      <th>tcgdp</th>
      <th>cc</th>
      <th>cg</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Argentina</td>
      <td>ARG</td>
      <td>2000</td>
      <td>37335.653</td>
      <td>0.999500</td>
      <td>2.950722e+05</td>
      <td>75.716805</td>
      <td>5.578804</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Australia</td>
      <td>AUS</td>
      <td>2000</td>
      <td>19053.186</td>
      <td>1.724830</td>
      <td>5.418047e+05</td>
      <td>67.759026</td>
      <td>6.720098</td>
    </tr>
    <tr>
      <th>2</th>
      <td>India</td>
      <td>IND</td>
      <td>2000</td>
      <td>1006300.297</td>
      <td>44.941600</td>
      <td>1.728144e+06</td>
      <td>64.575551</td>
      <td>14.072206</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Israel</td>
      <td>ISR</td>
      <td>2000</td>
      <td>6114.570</td>
      <td>4.077330</td>
      <td>1.292539e+05</td>
      <td>64.436451</td>
      <td>10.266688</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Malawi</td>
      <td>MWI</td>
      <td>2000</td>
      <td>11801.505</td>
      <td>59.543808</td>
      <td>5.026222e+03</td>
      <td>74.707624</td>
      <td>11.658954</td>
    </tr>
    <tr>
      <th>5</th>
      <td>South Africa</td>
      <td>ZAF</td>
      <td>2000</td>
      <td>45064.098</td>
      <td>6.939830</td>
      <td>2.272424e+05</td>
      <td>72.718710</td>
      <td>5.726546</td>
    </tr>
    <tr>
      <th>6</th>
      <td>United States</td>
      <td>USA</td>
      <td>2000</td>
      <td>282171.957</td>
      <td>1.000000</td>
      <td>9.898700e+06</td>
      <td>72.347054</td>
      <td>6.032454</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Uruguay</td>
      <td>URY</td>
      <td>2000</td>
      <td>3219.793</td>
      <td>12.099592</td>
      <td>2.525596e+04</td>
      <td>78.978740</td>
      <td>5.108068</td>
    </tr>
  </tbody>
</table>



- 切片选择行
  ```py
  df[2:5]
  ```

    <table>
    <thead>
      <tr style="text-align: right;">
        <th></th>
        <th>country</th>
        <th>country isocode</th>
        <th>year</th>
        <th>POP</th>
        <th>XRAT</th>
        <th>tcgdp</th>
        <th>cc</th>
        <th>cg</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>2</th>
        <td>India</td>
        <td>IND</td>
        <td>2000</td>
        <td>1006300.297</td>
        <td>44.941600</td>
        <td>1.728144e+06</td>
        <td>64.575551</td>
        <td>14.072206</td>
      </tr>
      <tr>
        <th>3</th>
        <td>Israel</td>
        <td>ISR</td>
        <td>2000</td>
        <td>6114.570</td>
        <td>4.077330</td>
        <td>1.292539e+05</td>
        <td>64.436451</td>
        <td>10.266688</td>
      </tr>
      <tr>
        <th>4</th>
        <td>Malawi</td>
        <td>MWI</td>
        <td>2000</td>
        <td>11801.505</td>
        <td>59.543808</td>
        <td>5.026222e+03</td>
        <td>74.707624</td>
        <td>11.658954</td>
      </tr>
    </tbody>
    </table>

  > 注：index为5的行取不到。

- 列名索引选择列
  
    > 要选择列，我们可以传递一个列表，其中包含以字符串表示的所需列的名称。
  
    ```py
    df[['country', 'tcgdp']]
    ``` 
  
     > 如果只选取一列，df['country']等价于df.country。

  <table>
    <thead>
      <tr style="text-align: right;">
        <th></th>
        <th>country</th>
        <th>tcgdp</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>0</th>
        <td>Argentina</td>
        <td>2.950722e+05</td>
      </tr>
      <tr>
        <th>1</th>
        <td>Australia</td>
        <td>5.418047e+05</td>
      </tr>
      <tr>
        <th>2</th>
        <td>India</td>
        <td>1.728144e+06</td>
      </tr>
      <tr>
        <th>3</th>
        <td>Israel</td>
        <td>1.292539e+05</td>
      </tr>
      <tr>
        <th>4</th>
        <td>Malawi</td>
        <td>5.026222e+03</td>
      </tr>
      <tr>
        <th>5</th>
        <td>South Africa</td>
        <td>2.272424e+05</td>
      </tr>
      <tr>
        <th>6</th>
        <td>United States</td>
        <td>9.898700e+06</td>
      </tr>
      <tr>
        <th>7</th>
        <td>Uruguay</td>
        <td>2.525596e+04</td>
      </tr>
    </tbody>
  </table>

- `iloc`方法选择，形式应为`.iloc[rows, columns]`

  ```py
  df.iloc[2:5, 0:4]
  ```

  <table>
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>country</th>
      <th>country isocode</th>
      <th>year</th>
      <th>POP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2</th>
      <td>India</td>
      <td>IND</td>
      <td>2000</td>
      <td>1006300.297</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Israel</td>
      <td>ISR</td>
      <td>2000</td>
      <td>6114.570</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Malawi</td>
      <td>MWI</td>
      <td>2000</td>
      <td>11801.505</td>
    </tr>
  </tbody>
  </table>


- `loc`方法选择，可以使用整数和标签混合的方法。
  
  ```py
  df.loc[df.index[2:5], ['country', 'tcgdp']]
  ```
    <table>
    <thead>
      <tr style="text-align: right;">
        <th></th>
        <th>country</th>
        <th>tcgdp</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>2</th>
        <td>India</td>
        <td>1.728144e+06</td>
      </tr>
      <tr>
        <th>3</th>
        <td>Israel</td>
        <td>1.292539e+05</td>
      </tr>
      <tr>
        <th>4</th>
        <td>Malawi</td>
        <td>5.026222e+03</td>
      </tr>
    </tbody>
    </table>
 
- 条件选择
  > 用`[]`操作符。`df.POP >= 20000`返回一系列布尔值，则`df[]`返回条件判断为 True 的行。
  ```py
  df[df.POP >= 20000]
  ```

    <table>
    <thead>
      <tr style="text-align: right;">
        <th></th>
        <th>country</th>
        <th>country isocode</th>
        <th>year</th>
        <th>POP</th>
        <th>XRAT</th>
        <th>tcgdp</th>
        <th>cc</th>
        <th>cg</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>0</th>
        <td>Argentina</td>
        <td>ARG</td>
        <td>2000</td>
        <td>37335.653</td>
        <td>0.99950</td>
        <td>2.950722e+05</td>
        <td>75.716805</td>
        <td>5.578804</td>
      </tr>
      <tr>
        <th>2</th>
        <td>India</td>
        <td>IND</td>
        <td>2000</td>
        <td>1006300.297</td>
        <td>44.94160</td>
        <td>1.728144e+06</td>
        <td>64.575551</td>
        <td>14.072206</td>
      </tr>
      <tr>
        <th>5</th>
        <td>South Africa</td>
        <td>ZAF</td>
        <td>2000</td>
        <td>45064.098</td>
        <td>6.93983</td>
        <td>2.272424e+05</td>
        <td>72.718710</td>
        <td>5.726546</td>
      </tr>
      <tr>
        <th>6</th>
        <td>United States</td>
        <td>USA</td>
        <td>2000</td>
        <td>282171.957</td>
        <td>1.00000</td>
        <td>9.898700e+06</td>
        <td>72.347054</td>
        <td>6.032454</td>
      </tr>
    </tbody>
    </table>

  > 等价于`.query()`方法，且这种方法在处理大规模数据时更快。
  ```py
  df.query("POP >= 20000")
  ```

  > 允许不同列之间做算术运算。
  ```py
  df[(df.cc + df.cg >= 80) & (df.POP <= 20000)]
  ```

    <table>
    <thead>
      <tr style="text-align: right;">
        <th></th>
        <th>country</th>
        <th>country isocode</th>
        <th>year</th>
        <th>POP</th>
        <th>XRAT</th>
        <th>tcgdp</th>
        <th>cc</th>
        <th>cg</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>4</th>
        <td>Malawi</td>
        <td>MWI</td>
        <td>2000</td>
        <td>11801.505</td>
        <td>59.543808</td>
        <td>5026.221784</td>
        <td>74.707624</td>
        <td>11.658954</td>
      </tr>
      <tr>
        <th>7</th>
        <td>Uruguay</td>
        <td>URY</td>
        <td>2000</td>
        <td>3219.793</td>
        <td>12.099592</td>
        <td>25255.961693</td>
        <td>78.978740</td>
        <td>5.108068</td>
      </tr>
    </tbody>
    </table>

  > 同样有`.query()`的等价方法，
  ```py
  df.query("cc + cg >= 80 & POP <= 20000")
  ```
  
  > `.loc[]`可以有相同的用法。
  ```py
  df.loc[df.cc == max(df.cc)] #可以选择cc列最大值的那一行
  ```
    <table>
    <thead>
      <tr style="text-align: right;">
        <th></th>
        <th>country</th>
        <th>country isocode</th>
        <th>year</th>
        <th>POP</th>
        <th>XRAT</th>
        <th>tcgdp</th>
        <th>cc</th>
        <th>cg</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>7</th>
        <td>Uruguay</td>
        <td>URY</td>
        <td>2000</td>
        <td>3219.793</td>
        <td>12.099592</td>
        <td>25255.961693</td>
        <td>78.97874</td>
        <td>5.108068</td>
      </tr>
    </tbody>
    </table>

  > `.loc[ , ]`第一个参数接受条件，第二个参数接受我们想要返回的列列表。
  ```py
  df.loc[(df.cc + df.cg >= 80) & (df.POP <= 20000), ['country', 'year', 'POP']]
  ```

    <table>
    <thead>
      <tr style="text-align: right;">
        <th></th>
        <th>country</th>
        <th>year</th>
        <th>POP</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>4</th>
        <td>Malawi</td>
        <td>2000</td>
        <td>11801.505</td>
      </tr>
      <tr>
        <th>7</th>
        <td>Uruguay</td>
        <td>2000</td>
        <td>3219.793</td>
      </tr>
    </tbody>
    </table>

