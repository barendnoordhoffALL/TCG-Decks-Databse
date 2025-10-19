DELETE FROM onepiecedeck where true;
DELETE FROM color where true;
DELETE FROM onepiecedeck_typings where true;
DELETE FROM onepiecedeckcolors where true;
DELETE FROM set where true;
DELETE FROM status where true;
DELETE FROM typing where true;

insert into onepiecedeck (leader, status, set, power, life) values
                                ('Luffy', 'Not in this meta', 'OP05', 5000, 5),
                                ('Reiju', 'Build', 'OP06', 5000, 4),
                                ('Gecko Moria', 'Building', 'OP06', 5000, 5),
                                ('Lucci', 'Interested', 'OP07', 5000, 5),
                                ('Kalgara', 'Taken apart', 'OP08', 5000, 5),
                                ('Lim', 'Taken Apart', 'OP09', 5000, 4),
                                ('Buggy', 'Build', 'OP09', 5000, 5),
                                ('Luffy', 'Build', 'OP09', 5000, 4),
                                ('Blackbeard', 'Build', 'OP09', 5000, 5),
                                ('Law', 'Building', 'OP10', 5000, 4),
                                ('Luffy', 'Build', 'OP11', 6000, 3),
                                ('Kuzan', 'Build', 'OP12', 5000, 5),
                                ('Zoro', 'Build', 'OP12', 5000, 5)