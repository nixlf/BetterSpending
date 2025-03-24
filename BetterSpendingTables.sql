CREATE TABLE SystemUser (
    UserID int PRIMARY KEY, 
    SystemUserFirstName nvarchar(50),
    SystemUserLastName nvarchar(50),
    SystemUserProfileImage nvarchar(500),
    SystemUserEmail nvarchar(200),
    SystemUserPassword nvarchar(100),
    LastLogin datetime,
    AccountTypeID int,
    FOREIGN KEY (AccountTypeID) REFERENCES AccountType(AccountTypeID)
);

CREATE TABLE AccountType (
    AccountTypeID int PRIMARY KEY,
    AccountTypeName nvarchar(50)
);

CREATE TABLE Expenses (
    ExpensesID int PRIMARY KEY,
    UserID int,
    CategoryID int,
    Amount int,
    Frequency int,
    RecurringID int,
    FOREIGN KEY (UserID) REFERENCES SystemUser(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Categories (
    CategoryID int PRIMARY KEY,
    UserID int,
    CategoryName nvarchar(50),
    CategoryType nvarchar(50),
    FOREIGN KEY (UserID) REFERENCES SystemUser(UserID)
);

CREATE TABLE Budgets (
    BudgetsID int PRIMARY KEY,
    UserID int,
    BudgetName nvarchar(50),
    TotalAmount double,
    StartDate datetime,
    EndDate datetime,
    CategoryID int,
    RecurringID int,
    LanguageID int,
    FOREIGN KEY (UserID) REFERENCES SystemUser(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (RecurringID) REFERENCES Recurring(RecurringID),
    FOREIGN KEY (LanguageID) REFERENCES Language(LanguageID)
);

CREATE TABLE Transaction (
    TransactionID int PRIMARY KEY,
    UserID int,
    CategoryID int,
    Amount double,
    Description nvarchar(2500),
    TransactionDate datetime,
    FOREIGN KEY (UserID) REFERENCES SystemUser(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Language (
    LanguageID int PRIMARY KEY,
    LanguageName nvarchar(50)
);

CREATE TABLE Recurring (
    RecurringID int PRIMARY KEY,
    DueDate datetime
);
