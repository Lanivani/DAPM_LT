use master
if exists (select * from sysdatabases where name = 'DBCoffee')
	drop database DBCoffee
go

create database DBCoffee
go
use DBCoffee
go

CREATE TABLE [dbo].[AdminUser] (
    [ID]           INT            NOT NULL,
    [NameUser]     NVARCHAR (50) NULL,
    [RoleUser]     NVARCHAR (50) NULL,
    [PasswordUser] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

--Bang Category
CREATE TABLE [dbo].[Category] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [IDCate]   NCHAR (20)     NOT NULL,
    [NameCate] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCate] ASC)
);
--Bang Customer
CREATE TABLE [dbo].[Customer] (
    [IDCus]    INT            IDENTITY (1, 1) NOT NULL,
    [NameCus]  NVARCHAR (50) NULL,
    [PhoneCus] NVARCHAR (15)  NULL,
    [EmailCus] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCus] ASC)
);

--Bang Product
CREATE TABLE [dbo].[Product] (
    [ProductID]     INT             IDENTITY (1, 1) NOT NULL,
    [NamePro]       NVARCHAR (50)  NULL,
    [DecriptionPro] NVARCHAR (1000)  NULL,
    [Category]      NCHAR (20)      NULL,
    [Price]         DECIMAL (20, 3) NULL,
    [ImagePro]      NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Pro_Category] FOREIGN KEY ([Category]) REFERENCES [dbo].[Category] ([IDCate])
);
--Bang OrderPro
CREATE TABLE [dbo].[OrderPro] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [DateOrder]        DATE           NULL,
    [IDCus]            INT            NULL,
    [AddressDeliverry] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDCus]) REFERENCES [dbo].[Customer] ([IDCus])
);

--Bang OrderDetail
CREATE TABLE [dbo].[OrderDetail] (
    [ID]        INT        IDENTITY (1, 1) NOT NULL,
    [IDProduct] INT        NULL,
    [IDOrder]   INT        NULL,
    [Quantity]  INT        NULL,
    [UnitPrice] FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDProduct]) REFERENCES [dbo].[Product] ([ProductID]),
    FOREIGN KEY ([IDOrder]) REFERENCES [dbo].[OrderPro] ([ID])
);



------AdminUser
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (1, 'Phung', 'Quanly', '1122334455')
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (2, 'Nhu', 'ThuKy', '5544332211')



------Customer
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Trần Phi Phụng', '0901729455', 'tranphiphung@gmail.com')
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Đoàn Quỳnh Như', '0913678345', 'Quynhnhu@gmail.com')


------Category
Insert into Category (IDCate, NameCate)
    Values(N'C1', N'Cà phê Arabica')
Insert into Category (IDCate, NameCate)
    Values(N'C2', N'Cà phê Bourbon')
Insert into Category (IDCate, NameCate)
    Values(N'C3', N'Cà phê Typica')
Insert into Category (IDCate, NameCate)
    Values(N'C4', N'Cà phê Robusta')
Insert into Category (IDCate, NameCate)
    Values(N'C5', N'Cà phê Culi')
Insert into Category (IDCate, NameCate)
    Values(N'C6', N'Cà phê Cherry')
select * from Category

--------Product
--Arabica
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Arabica 1', N'Cà phê Kona được sản xuất ở Hawaii, đặc biệt là trên đảo Hawaii (Big Island), và được biết đến với hương vị ngọt ngào và đầy đặn.', N'C1', 175, '/Content/images/Arabica1.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Arabica 2', N'Cà phê Bourbon Pink có hương vị mềm mại và thường có hương thơm của trái cây đỏ và cam', N'C1', 180, '/Content/images/Arabica2.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Arabica 3', N'Cà phê Bourbon Amarello thường có hương vị mềm mại và hương thơm của cam và cam quýt', N'C1', 175, '/Content/images/Arabica3.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Arabica 4', N'Cà phê này được trồng ở Colombia và thường có hương vị mềm mại, cân bằng, và có độ acid cao', N'C1', 245, '/Content/images/Arabica4.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Arabica 5', N'Cà phê Robusta thường được sử dụng trong cà phê espresso để tạo ra lớp bọt mousse đặc biệt và hương vị mạnh mẽ', N'C1', 155, '/Content/images/Arabica5.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Arabica 6', N'Cà phê Robusta từ Cameroon thường có hương vị mạnh và độ đắng, thường được sử dụng để tạo ra cà phê espresso.', N'C1', 250, '/Content/images/Arabica6.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Arabica 7', N'Cà phê Culi Chồn, hay còn gọi là cà phê chồn, được sản xuất bằng cách cho chồn ăn và sau đó thu thập hạt cà phê từ phân của chúng. Loại này có hương vị đặc biệt và độ đắng nhẹ', N'C1', 245, '/Content/images/Arabica7.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Arabica 8', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'C1', 180, '/Content/images/Arabica8.jpg')

--Bourbon
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon 1', N'Cà phê Kona được sản xuất ở Hawaii, đặc biệt là trên đảo Hawaii (Big Island), và được biết đến với hương vị ngọt ngào và đầy đặn.', N'C3', 175, '/Content/images/Bourbon1.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon 2', N'Cà phê Bourbon Pink có hương vị mềm mại và thường có hương thơm của trái cây đỏ và cam', N'C2', 180, '/Content/images/Bourbon2.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon 3', N'Cà phê Bourbon Amarello thường có hương vị mềm mại và hương thơm của cam và cam quýt', N'C2', 175, '/Content/images/Bourbon3.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon 4', N'Cà phê này được trồng ở Colombia và thường có hương vị mềm mại, cân bằng, và có độ acid cao', N'C2', 245, '/Content/images/Bourbon4.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon 5', N'Cà phê Robusta thường được sử dụng trong cà phê espresso để tạo ra lớp bọt mousse đặc biệt và hương vị mạnh mẽ', N'C2', 155, '/Content/images/Bourbon5.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon 6', N'Cà phê Robusta từ Cameroon thường có hương vị mạnh và độ đắng, thường được sử dụng để tạo ra cà phê espresso.', N'C2', 250, '/Content/images/Bourbon6.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon 7', N'Cà phê Culi Chồn, hay còn gọi là cà phê chồn, được sản xuất bằng cách cho chồn ăn và sau đó thu thập hạt cà phê từ phân của chúng. Loại này có hương vị đặc biệt và độ đắng nhẹ', N'C2', 245, '/Content/images/Bourbon7.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Bourbon 8', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'C2', 180, '/Content/images/Bourbon8.jpg')

--Typica
	Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Typica 1', N'Cà phê Kona được sản xuất ở Hawaii, đặc biệt là trên đảo Hawaii (Big Island), và được biết đến với hương vị ngọt ngào và đầy đặn.', N'C3', 175, '/Content/images/img1.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Typica 2', N'Cà phê Bourbon Pink có hương vị mềm mại và thường có hương thơm của trái cây đỏ và cam', N'C3', 180, '/Content/images/img2.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Typica 3', N'Cà phê Bourbon Amarello thường có hương vị mềm mại và hương thơm của cam và cam quýt', N'C3', 175, '/Content/images/img3.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Typica 4', N'Cà phê này được trồng ở Colombia và thường có hương vị mềm mại, cân bằng, và có độ acid cao', N'C3', 245, '/Content/images/img4.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Typica 5', N'Cà phê Robusta thường được sử dụng trong cà phê espresso để tạo ra lớp bọt mousse đặc biệt và hương vị mạnh mẽ', N'C3', 155, '/Content/images/img5.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Typica 6', N'Cà phê Robusta từ Cameroon thường có hương vị mạnh và độ đắng, thường được sử dụng để tạo ra cà phê espresso.', N'C3', 250, '/Content/images/img6.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Typica 7', N'Cà phê Culi Chồn, hay còn gọi là cà phê chồn, được sản xuất bằng cách cho chồn ăn và sau đó thu thập hạt cà phê từ phân của chúng. Loại này có hương vị đặc biệt và độ đắng nhẹ', N'C3', 245, '/Content/images/img7.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Typica 8', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'C3', 180, '/Content/images/img8.jpg')

--Robusta
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Robusta 1', N'Cà phê Kona được sản xuất ở Hawaii, đặc biệt là trên đảo Hawaii (Big Island), và được biết đến với hương vị ngọt ngào và đầy đặn.', N'C3', 175, '/Content/images/Robusta1.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Robusta 2', N'Cà phê Bourbon Pink có hương vị mềm mại và thường có hương thơm của trái cây đỏ và cam', N'C4', 180, '/Content/images/Robusta2.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Robusta 3', N'Cà phê Bourbon Amarello thường có hương vị mềm mại và hương thơm của cam và cam quýt', N'C4', 175, '/Content/images/Robusta3.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Robusta 4', N'Cà phê này được trồng ở Colombia và thường có hương vị mềm mại, cân bằng, và có độ acid cao', N'C4', 245, '/Content/images/Robusta4.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Robusta 5', N'Cà phê Robusta thường được sử dụng trong cà phê espresso để tạo ra lớp bọt mousse đặc biệt và hương vị mạnh mẽ', N'C4', 155, '/Content/images/Robusta5.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Robusta 6', N'Cà phê Robusta từ Cameroon thường có hương vị mạnh và độ đắng, thường được sử dụng để tạo ra cà phê espresso.', N'C4', 250, '/Content/images/Robusta6.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Robusta 7', N'Cà phê Culi Chồn, hay còn gọi là cà phê chồn, được sản xuất bằng cách cho chồn ăn và sau đó thu thập hạt cà phê từ phân của chúng. Loại này có hương vị đặc biệt và độ đắng nhẹ', N'C4', 245, '/Content/images/Robusta7.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Robusta 8', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'C4', 180, '/Content/images/Robusta8.jpg')

--Culi
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Culi 1', N'Cà phê Kona được sản xuất ở Hawaii, đặc biệt là trên đảo Hawaii (Big Island), và được biết đến với hương vị ngọt ngào và đầy đặn.', N'C5', 175, '/Content/images/Culi1.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Culi 2', N'Cà phê Bourbon Pink có hương vị mềm mại và thường có hương thơm của trái cây đỏ và cam', N'C5', 180, '/Content/images/Culi2.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Culi 3', N'Cà phê Bourbon Amarello thường có hương vị mềm mại và hương thơm của cam và cam quýt', N'C5', 175, '/Content/images/Culi3.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Culi 4', N'Cà phê này được trồng ở Colombia và thường có hương vị mềm mại, cân bằng, và có độ acid cao', N'C5', 245, '/Content/images/Culi4.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Culi 5', N'Cà phê Robusta thường được sử dụng trong cà phê espresso để tạo ra lớp bọt mousse đặc biệt và hương vị mạnh mẽ', N'C5', 155, '/Content/images/Culi5.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Culi 6', N'Cà phê Robusta từ Cameroon thường có hương vị mạnh và độ đắng, thường được sử dụng để tạo ra cà phê espresso.', N'C5', 250, '/Content/images/Culi6.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Culi 7', N'Cà phê Culi Chồn, hay còn gọi là cà phê chồn, được sản xuất bằng cách cho chồn ăn và sau đó thu thập hạt cà phê từ phân của chúng. Loại này có hương vị đặc biệt và độ đắng nhẹ', N'C5', 245, '/Content/images/Culi7.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Culi 8', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'C5', 180, '/Content/images/Culi8.jpg')

--Cherry
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cherry 1', N'Cà phê Kona được sản xuất ở Hawaii, đặc biệt là trên đảo Hawaii (Big Island), và được biết đến với hương vị ngọt ngào và đầy đặn.', N'C6', 175, '/Content/images/Cherry1.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cherry 2', N'Cà phê Bourbon Pink có hương vị mềm mại và thường có hương thơm của trái cây đỏ và cam', N'C6', 180, '/Content/images/Cherry2.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cherry 3', N'Cà phê Bourbon Amarello thường có hương vị mềm mại và hương thơm của cam và cam quýt', N'C6', 175, '/Content/images/Cherry3.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cherry 4', N'Cà phê này được trồng ở Colombia và thường có hương vị mềm mại, cân bằng, và có độ acid cao', N'C6', 245, '/Content/images/Cherry4.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cherry 5', N'Cà phê Robusta thường được sử dụng trong cà phê espresso để tạo ra lớp bọt mousse đặc biệt và hương vị mạnh mẽ', N'C6', 155, '/Content/images/Cherry5.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cherry 6', N'Cà phê Robusta từ Cameroon thường có hương vị mạnh và độ đắng, thường được sử dụng để tạo ra cà phê espresso.', N'C6', 250, '/Content/images/Cherry6.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cherry 7', N'Cà phê Culi Chồn, hay còn gọi là cà phê chồn, được sản xuất bằng cách cho chồn ăn và sau đó thu thập hạt cà phê từ phân của chúng. Loại này có hương vị đặc biệt và độ đắng nhẹ', N'C6', 245, '/Content/images/Cherry7.jpg')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cherry 8', N'Cascara là một loại đồ uống được làm từ trái cây cà phê Cherry đã được sấy khô. Nó có hương vị ngọt ngào và thường được nấu thành trà.', N'C5', 180, '/Content/images/Cherry8.jpg')
--------OrderPro
Insert into OrderPro (DateOrder, IDCus, AddressDeliverry)
	values ('01/01/2022', 1, N'155 Su Vạn Hạnh,q10')

--------OrderDetail
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (1, 1, 5, 600)

	ALTER TABLE Customer
ADD UserName varchar(50), Password nvarchar(50)

select * from Customer
