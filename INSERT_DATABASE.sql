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