HA$PBExportHeader$w_base.srw
$PBExportComments$window base
forward
global type w_base from Window
end type
end forward

global type w_base from Window
int X=654
int Y=268
int Width=1819
int Height=1108
boolean TitleBar=true
string Title="Untitled"
long BackColor=80269524
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
event ue_new ( )
event ue_save ( )
event ue_print ( )
event ue_undo ( )
event ue_cut ( )
event ue_copy ( )
event ue_paste ( )
event ue_insertrow ( )
event ue_deleterow ( )
event ue_find ( )
event ue_sort ( )
event ue_open ( )
event ue_close ( )
event ue_saveas ( )
event ue_preview ( readonly boolean ab_preview )
event ue_filter ( )
end type
global w_base w_base

forward prototypes
protected subroutine of_settitle (readonly string as_title)
end prototypes

protected subroutine of_settitle (readonly string as_title);
Title = as_title
end subroutine

on w_base.create
end on

on w_base.destroy
end on

