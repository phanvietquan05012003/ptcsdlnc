CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    CreatedDate DATE,
    Status VARCHAR(50) DEFAULT 'Active'
);

CREATE TABLE Role (
    RoleID INT PRIMARY KEY AUTO_INCREMENT,
    RoleName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT
);

CREATE TABLE Permission (
    PermissionID INT PRIMARY KEY AUTO_INCREMENT,
    PermissionName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT
);

CREATE TABLE UserRole (
    UserRoleID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    RoleID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

CREATE TABLE RolePermission (
    RolePermissionID INT PRIMARY KEY AUTO_INCREMENT,
    RoleID INT NOT NULL,
    PermissionID INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
    FOREIGN KEY (PermissionID) REFERENCES Permission(PermissionID)
);
