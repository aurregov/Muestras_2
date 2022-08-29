HA$PBExportHeader$n_cst_file_base.sru
$PBExportComments$objeto para el manejo de los archivos del sistema
forward
global type n_cst_file_base from nonvisualobject
end type
type lstr_security from structure within n_cst_file_base
end type
end forward

type lstr_security from structure
	unsignedlong		ul_length
	string		ch_description
	boolean		b_inherit
end type

global type n_cst_file_base from nonvisualobject autoinstantiate
end type

type prototypes
Function boolean CreateDirectoryA (ref string directoryname, ref lstr_security secattr) library "KERNEL32.DLL" alias for "CreateDirectoryA;Ansi"
Function boolean SetCurrentDirectoryA (ref string directoryname ) library "KERNEL32.DLL" alias for "SetCurrentDirectoryA;Ansi"
Function ulong GetFileAttributesA (ref string filename) library "KERNEL32.DLL" alias for "GetFileAttributesA;Ansi"
Function ulong GetCurrentDirectoryA (ulong textlen, ref string dirtext) library "KERNEL32.DLL" alias for "GetCurrentDirectoryA;Ansi"
Function boolean RemoveDirectoryA (ref string directoryname) library "KERNEL32.DLL" alias for "RemoveDirectoryA;Ansi"
Function boolean GetDiskFreeSpaceA (string drive, ref long sectpercluster, ref long bytespersect, ref long freeclusters, ref long totalclusters) library "KERNEL32.DLL" alias for "GetDiskFreeSpaceA;Ansi"
Function ulong GetDriveTypeA (string drive) library "KERNEL32.DLL" alias for "GetDriveTypeA;Ansi"
FUNCTION boolean CopyFileA(ref string cfrom, ref string cto, boolean flag) LIBRARY "Kernel32.dll" alias for "CopyFileA;Ansi"
FUNCTION ulong GetWindowsDirectoryA(ref string wdir, ulong buf) LIBRARY "kernel32.dll" alias for "GetWindowsDirectoryA;Ansi" 
Function ulong GetTempPathA (ulong nBufferLength, ref string lpBuffer) library "KERNEL32.DLL" alias for "GetTempPathA;Ansi" 
Function boolean MoveFileA (ref string oldfile, ref string newfile) library "KERNEL32.DLL" alias for "MoveFileA;Ansi"
Function long FindFirstFile (ref string sPathName, ref s_file_data fd) LIBRARY "KERNEL32.DLL" alias for "FindFirstFileA;Ansi"
Function long FindNextFile (long lFileHandle, ref s_file_data fd) LIBRARY "KERNEL32.DLL" alias for "FindNextFileA;Ansi"

end prototypes

type variables
Private:


        String  is_validacion

      
end variables

forward prototypes
public function integer of_createdirectory (string as_directoryname)
public function boolean of_directoryexists (string as_directory)
public function string of_getcurrentdirectory ()
public function integer of_removedirectory (string as_directory)
public function string of_getprofile (readonly string as_path, readonly string as_session, readonly string as_key)
public function integer of_setprofile (readonly string as_path, readonly string as_session, readonly string as_key, readonly string as_value)
public function integer of_changedirectory (string as_directory)
public function integer of_getdiskspace (string as_drive, ref long al_totalspace, ref long al_freespace)
public function integer of_getdrivetype (string as_drive)
public function boolean of_copyfile (string as_from, string as_to, boolean ab_overwrite)
public function string of_getwindowsdirectory ()
public function string of_gettempdirectory ()
public function boolean of_movefile (string as_from, string as_to)
public function boolean of_fileexists (string as_path)
public function boolean of_filedelete (string as_path)
public function integer of_fileopen (string as_path, boolean ab_filemodeline, boolean ab_accesswrite, boolean ab_append)
public function integer of_fileclose (integer ai_filenum)
public function integer of_filewrite (integer ai_filenum, string as_text)
public function integer of_getlistfilesdirectory (string as_path, ref string as_listfiles[])
end prototypes

public function integer of_createdirectory (string as_directoryname);lstr_security lstr_sec


lstr_sec.ul_Length = 7
SetNull(lstr_sec.ch_description)	
lstr_sec.b_Inherit = False

If CreateDirectoryA(as_directoryname,lstr_sec) Then 
  Return 0
End If

Return -1
end function

public function boolean of_directoryexists (string as_directory);ulong	lul_attrib


lul_attrib = GetFileAttributesA(as_directory)

If Mod(Integer(lul_attrib / 16), 2) > 0 Then 
	Return True
End If

Return False
end function

public function string of_getcurrentdirectory ();Ulong	 lul_size = 260,lul_result
String ls_currentdir


ls_currentdir = Space(lul_size)

lul_result = GetCurrentDirectoryA(lul_size,ls_currentdir)

If lul_result > 0 Then
	Return ls_currentdir
End If

Return ""
end function

public function integer of_removedirectory (string as_directory);

If Not of_DirectoryExists(as_directory) Then Return 0

If RemoveDirectoryA(as_directory) Then
	Return 0
End If

Return -1
end function

public function string of_getprofile (readonly string as_path, readonly string as_session, readonly string as_key);
Return ProfileString ( as_path, as_session, as_key, "" )
end function

public function integer of_setprofile (readonly string as_path, readonly string as_session, readonly string as_key, readonly string as_value);
Return SetProfileString ( as_path, as_session, as_key, as_value )
end function

public function integer of_changedirectory (string as_directory);

If Trim(as_directory) = "" Then Return -1

If SetCurrentDirectoryA(as_directory) Then
	Return 0
Else
	Return -1
End If
end function

public function integer of_getdiskspace (string as_drive, ref long al_totalspace, ref long al_freespace);Long   ll_SectPerCluster,ll_BytesPerSect,ll_FreeClusters,ll_TotalClusters,ll_ClusterBytes
String ls_string



ls_string = Upper(Mid(as_drive,1,1)) + ":\"

If Not GetDiskFreeSpaceA(ls_string,ll_SectPerCluster,ll_BytesPerSect,ll_FreeClusters,ll_TotalClusters) Then Return -1

ll_ClusterBytes = ll_SectPerCluster * ll_BytesPerSect
al_TotalSpace   = ll_ClusterBytes * ll_TotalClusters
al_FreeSpace    = ll_ClusterBytes * ll_FreeClusters

Return 1
end function

public function integer of_getdrivetype (string as_drive);//	Returns:			Integer
//						The type of the drive:
//						2 - floppy drive,
//						3 - hard drive,
//						4 - network drive,
//						5 - cdrom drive,
//						6 - ramdisk,

ulong  lul_drivetype
string ls_drive

ls_drive = Upper(Mid(as_drive,1,1)) + ":\"

lul_drivetype = GetDriveTypeA(ls_drive)

return lul_drivetype
end function

public function boolean of_copyfile (string as_from, string as_to, boolean ab_overwrite);
ab_overwrite = Not ab_overwrite

Return CopyFileA(as_from,as_to,ab_overwrite)
end function

public function string of_getwindowsdirectory ();Ulong  ll_buf  = 255
String ls_windir 

ls_windir = space(ll_buf) 

GetWindowsDirectoryA(ls_windir,ll_buf) 

return ls_windir
end function

public function string of_gettempdirectory ();Ulong  lul_return
Long   li_max = 260
String ls_path

ls_path = Space(li_max)

lul_return = GetTempPathA(li_max,ls_path)

If (lul_return > li_max ) Or (lul_return = 0) Then SetNull(ls_path)

Return ls_path
end function

public function boolean of_movefile (string as_from, string as_to);


Return MoveFileA(as_from,as_to)
end function

public function boolean of_fileexists (string as_path);

Return FileExists(as_path)
end function

public function boolean of_filedelete (string as_path);

Return FileDelete(as_path)
end function

public function integer of_fileopen (string as_path, boolean ab_filemodeline, boolean ab_accesswrite, boolean ab_append);
integer li_FileNo, li_Writes, li_Cnt
long ll_BlobLen, ll_CurrentPos
blob lblb_Data
filemode   lfm_mode
writemode  lwm_mode
fileaccess lfa_mode

// Mode lectura
If ab_filemodeline Then
	lfm_mode = LineMode! 
Else
	lfm_mode = StreamMode! 
End If

// Forma de acceso
If ab_accesswrite Then
	lfa_mode = Write!  
Else
	lfa_mode = Read! 
End If

// Adiciona o remplaza el contenido
If ab_append Then
	lwm_mode = Append!
Else
	lwm_mode = Replace!
End if

li_FileNo = FileOpen(as_path,lfm_mode,lfa_mode,LockReadWrite!,lwm_mode)


Return li_FileNo
end function

public function integer of_fileclose (integer ai_filenum);
return FileClose(ai_filenum)
end function

public function integer of_filewrite (integer ai_filenum, string as_text);
return FileWrite(ai_filenum,as_text)
end function

public function integer of_getlistfilesdirectory (string as_path, ref string as_listfiles[]);s_file_data lstr_filedata // Array con la informaci$$HEX1$$f300$$ENDHEX$$n del archivo
long ll_handle,& 
     ll_morefiles,& 
     ll_pos



ll_handle = FindFirstFile (as_path, lstr_filedata)

// Validar si el archivo se encontro
If ll_handle = -1 Then
	is_validacion = 'Archivo no encontrado.'
	Return -1
Else
	ll_pos=1
	Do				
		as_listfiles[ll_pos] = lstr_filedata.ch_filename		
		ll_pos++
		
		ll_morefiles = FindNextFile (ll_handle,lstr_filedata)
	Loop While ll_morefiles = 1 
End If

Return 0
end function

on n_cst_file_base.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_file_base.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

