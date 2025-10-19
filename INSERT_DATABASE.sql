delete from set where true;

insert into set(setname) values ('OP05'),
                                ('OP06'),
                                ('OP07'),
                                ('OP08'),
                                ('OP09'),
                                ('OP10'),
                                ('OP11'),
                                ('OP12'),
                                ('OP13'),
                                ('ST08'),
                                ('ST12'),
                                ('ST16'),
                                ('ST18'),
                                ('ST22'),
                                ('ST25'),
                                ('ST26'),
                                ('ST27');

delete from color where true;

insert into color(color) values ('Yellow'),
                                ('Black'),
                                ('Blue'),
                                ('Red'),
                                ('Green'),
                                ('Purple');

delete from status where true;

insert into status (status) values ('Build'),
                                   ('Building'),
                                   ('Considering'),
                                   ('Interested'),
                                   ('Not in this meta'),
                                   ('Taken apart');



insert into onepiecedeck (leader, status, set, power, life) values
                                ('Luffy', 'Not in this meta', 'OP05', 5000, 5),
                                ('Reiju', 'Build', 'OP06', 5000, 4),
                                ('Gecko Moria', 'Building', 'OP06', 5000, 5),
                                ('Lucci', 'Interested', 'OP07', 5000, 5),
                                ('Kalgara', 'Taken apart', 'OP08', 5000, 5),
                                ('Lim', 'Taken apart', 'OP09', 5000, 4),
                                ('Buggy', 'Build', 'OP09', 5000, 5),
                                ('Luffy', 'Build', 'OP09', 5000, 4),
                                ('Blackbeard', 'Build', 'OP09', 5000, 5),
                                ('Law', 'Building', 'OP10', 5000, 4),
                                ('Luffy', 'Build', 'OP11', 6000, 3),
                                ('Kuzan', 'Build', 'OP12', 5000, 5),
                                ('Zoro', 'Interested', 'OP12', 5000, 5),
                                ('Sabo', 'Building', 'OP13', 5000, 5),
                                ('Luffy', 'Taken apart', 'ST08', 5000, 5),
                                ('Zoro & Sanji', 'Interested', 'ST12', 5000, 4),
                                ('Uta', 'Build', 'ST16', 5000, 5),
                                ('Smoker', 'Taken apart', 'ST18', 5000, 5),
                                ('Ace & Whitebeard', 'Build', 'ST22', 5000, 5)