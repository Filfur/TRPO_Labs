-- Works at least at https://sqliteonline.com

create table Permission (
    Id integer primary key autoincrement,
    Name text unique not null
);

create table Role (
    Id integer primary key autoincrement,
    Name text unique not null
);

create table RoleAssignment (
    Id integer primary key autoincrement,
    RoleId text not null,
    PermissionId integer not null,

    foreign key(RoleId) references Role(Id),
    foreign key(PermissionId) references Permission(Id)
);

create table User (
    Id integer primary key autoincrement,
    Name text unique not null,
    RoleId integer not null,

    foreign key(RoleId) references Role(Id)
);

create table Project (
    Id integer primary key autoincrement,
    Name text unique not null,
    Description text not null,
    CreatedAt datetime not null,
    Requirements text not null,
    OwnerId integer not null,

    foreign key(OwnerId) references User(Id)
);

create table Task (
    Id integer primary key autoincrement,
    Name text unique not null,
    Description text,
    CreatedAt datetime not null,
    Fields text not null,
    IsActive boolean not null,
    IsCompleted boolean not null,
    IsDeleted boolean not null,

    ProjectId integer not null,
    OwnerId integer not null,

    foreign key(ProjectId) references Project(Id),
    foreign key(OwnerId) references User(Id)
);