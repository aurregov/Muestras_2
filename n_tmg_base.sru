HA$PBExportHeader$n_tmg_base.sru
$PBExportComments$Timing base
forward
global type n_tmg_base from timing
end type
end forward

global type n_tmg_base from timing
end type
global n_tmg_base n_tmg_base

on n_tmg_base.create
call timing::create
TriggerEvent( this, "constructor" )
end on

on n_tmg_base.destroy
call timing::destroy
TriggerEvent( this, "destructor" )
end on

