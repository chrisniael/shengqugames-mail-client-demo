# 盛趣邮箱客户端 Demo

基于 Bash 实现简单功能的 Demo，目的是检验分析 API 接口后自主研发第三方邮件客户端的可行性。

## 登录

### Request

```http
POST https://mail.shengqugames.com/slogin.do
```

#### Params

| KEY    | DESCRIPTION       |
| ------ | ----------------- |
| random | 随机数字 ∈ (0，1) |

#### Headers

| KEY          | VALUE                             | DESCRIPTION                |
| ------------ | --------------------------------- | -------------------------- |
| Content-Type | application/x-www-form-urlencoded | 请求 body 数据的 MIME 类型 |

#### Body

| KEY          | DESCRIPTION              |
| ------------ | ------------------------ |
| username     | 邮箱地址                 |
| pwd          | 密码                     |
| dyn          | 动态密保                 |
| password     | 密码+动态密保（不包括+） |
| submit.x     |                          |
| submit.y     |                          |
| timezonelist | 时区，Asia/Shanghai      |
| sameip       |                          |

### Response

#### 成功

##### Status

| VALUE | MESSAGE           |
| ----- | ----------------- |
| 302   | Moved Temporarily |

##### Headers

| KEY          | VALUE                   | DESCRIPTION          |
| ------------ | ----------------------- | -------------------- |
| Content-Type | text/html;charset=utf-8 | 响应 body 数据的类型 |

##### Body

空

#### 失败

##### Status

| VALUE | MESSAGE               |
| ----- | --------------------- |
| 500   | Internal Server Error |

##### Headers

| KEY          | VALUE                   | DESCRIPTION          |
| ------------ | ----------------------- | -------------------- |
| Content-Type | text/html;charset=utf-8 | 响应 body 数据的类型 |

##### Body

```
...
<td align="left">
	<p>
		错误
	</p>
	<br>
	<p>
		无效的登陆密码
	</p>
	<br>
	<input type="button" value="返回" onclick="Javascript:history.back()"/>
</td>
...
```

### Example

#### 请求

```http
POST /slogin.do?random=0.2110622893975318 HTTP/1.1
Host: mail.shengqugames.com
Content-Type: application/x-www-form-urlencoded

username=shenyu.tommy%40shengqugames.com&pwd=****&dyn=ccewqw&password=****ccewqw&submit.x=70&submit.y=6&timezonelist=Asia%2FShanghai&sameip=1
```

#### 响应

##### 成功

```http
HTTP/1.1 302 Moved Temporarily
Content-Type: text/html;charset=utf-8
Location: https://mail.shengqugames.com/mail/mail.do;jsessionid=E3DF33F6C8200E0E917CE4B3C92D4188?locale=zh_CN?customizedTheme=
```

##### 失败

```http
HTTP/1.1 500 Internal Server Error
Content-Type: text/html;charset=utf-8

...
<td align="left">
	<p>
		错误
	</p>
	<br>
	<p>
		无效的登陆密码
	</p>
	<br>
	<input type="button" value="返回" onclick="Javascript:history.back()"/>
</td>
...
```

## 新邮件通知



## 获取未读邮件列表



## 获取邮件列表



## 获取某封邮件具体内容那个



#### 