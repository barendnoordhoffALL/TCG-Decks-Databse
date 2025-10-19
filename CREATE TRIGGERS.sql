CREATE OR REPLACE VIEW vw_ListOfDecksWithColorsAndStatus AS (
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