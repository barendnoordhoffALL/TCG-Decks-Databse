/*===========================*/
/*        TRIGGERS           */
/*===========================*/

create or replace function checkMainDeckAmount() returns trigger as $$
    begin
        if ((select (count(*)) > 3 from onepiecedeck where mained)) then
            raise exception 'You cannot main more than 3 decks at the same time, dont be so indecisive :p';
        else
            return null;
        end if;
    end; $$
language plpgsql;

create or replace trigger tr_only3DecksCanBeMainedAtATime after insert or update
    on onepiecedeck
    execute FUNCTION checkMainDeckAmount();

begin transaction;

    update onepiecedeck set mained = true where leader = 'Law' and set = 'OP10';

    update onepiecedeck set mained = true where leader = 'Gecko Moria' and set = 'OP06';

rollback transaction;

/*===========================*/
/*          VIEWS            */
/*===========================*/

create or replace view vw_ListOfDecksWithColorsAndStatus as (
                        select OPD.leader, OPD.set, C.color, S.status from onepiecedeck OPD
                            inner join onepiecedeckcolors OPC
                                on OPD.leader = OPC.leader
                                           and OPD.set = OPC.setname
                            inner join color C
                                on OPC.color = C.color
                            inner join status S
                                on OPD.status = S.status
                        group by OPD.set, OPD.leader, C.color, S.status
                                     );