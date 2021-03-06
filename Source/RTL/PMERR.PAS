UNIT PMERR;

{****************************** Module Header ******************************
*                                                                          *
* Module Name: PMERR.PAS                                                   *
*                                                                          *
* OS/2 Presentation Manager Error Codes                                    *
*                                                                          *
****************************************************************************}

INTERFACE

USES Os2Def;


CONST
{***************************************************************************
*** Window Manager error codes
***************************************************************************}

     PMERR_INVALID_HWND                  = $1001;
     PMERR_INVALID_HMQ                   = $1002;
     PMERR_PARAMETER_OUT_OF_RANGE        = $1003;
     PMERR_WINDOW_LOCK_UNDERFLOW         = $1004;
     PMERR_WINDOW_LOCK_OVERFLOW          = $1005;
     PMERR_BAD_WINDOW_LOCK_COUNT         = $1006;
     PMERR_WINDOW_NOT_LOCKED             = $1007;
     PMERR_INVALID_SELECTOR              = $1008;
     PMERR_CALL_FROM_WRONG_THREAD        = $1009;
     PMERR_RESOURCE_NOT_FOUND            = $100A;
     PMERR_INVALID_STRING_PARM           = $100B;
     PMERR_INVALID_HHEAP                 = $100C;
     PMERR_INVALID_HEAP_POINTER          = $100D;
     PMERR_INVALID_HEAP_SIZE_PARM        = $100E;
     PMERR_INVALID_HEAP_SIZE             = $100F;
     PMERR_INVALID_HEAP_SIZE_WORD        = $1010;
     PMERR_HEAP_OUT_OF_MEMORY            = $1011;
     PMERR_HEAP_MAX_SIZE_REACHED         = $1012;
     PMERR_INVALID_HATOMTBL              = $1013;
     PMERR_INVALID_ATOM                  = $1014;
     PMERR_INVALID_ATOM_NAME             = $1015;
     PMERR_INVALID_INTEGER_ATOM          = $1016;
     PMERR_ATOM_NAME_NOT_FOUND           = $1017;
     PMERR_QUEUE_TOO_LARGE               = $1018;
     PMERR_INVALID_FLAG                  = $1019;
     PMERR_INVALID_HACCEL                = $101A;
     PMERR_INVALID_HPTR                  = $101B;
     PMERR_INVALID_HENUM                 = $101C;
     PMERR_INVALID_SRC_CODEPAGE          = $101D;
     PMERR_INVALID_DST_CODEPAGE          = $101E;

     { These are not real error codes, but just used to access special  }
     { error message strings used by WinGetErrorInfo to format an error }
     { message.                                                         }

     PMERR_UNKNOWN_COMPONENT_ID          = $101f;
     PMERR_UNKNOWN_ERROR_CODE            = $1020;
     PMERR_SEVERITY_LEVELS               = $1021;

     { $1022 - $1033, $1035, $104B - $104C used elsewhere          }
     PMERR_INVALID_RESOURCE_FORMAT       = $1034;
     WINDBG_WINDOW_UNLOCK_WAIT           = $1035;
     PMERR_NO_MSG_QUEUE                  = $1036;
     PMERR_WIN_DEBUGMSG                  = $1037;
     PMERR_QUEUE_FULL                    = $1038;

     PMERR_LIBRARY_LOAD_FAILED           = $1039;
     PMERR_PROCEDURE_LOAD_FAILED         = $103A;
     PMERR_LIBRARY_DELETE_FAILED         = $103B;
     PMERR_PROCEDURE_DELETE_FAILED       = $103C;
     PMERR_ARRAY_TOO_LARGE               = $103D;
     PMERR_ARRAY_TOO_SMALL               = $103E;
     PMERR_DATATYPE_ENTRY_BAD_INDEX      = $103F;
     PMERR_DATATYPE_ENTRY_CTL_BAD        = $1040;
     PMERR_DATATYPE_ENTRY_CTL_MISS       = $1041;
     PMERR_DATATYPE_ENTRY_INVALID        = $1042;
     PMERR_DATATYPE_ENTRY_NOT_NUM        = $1043;
     PMERR_DATATYPE_ENTRY_NOT_OFF        = $1044;
     PMERR_DATATYPE_INVALID              = $1045;
     PMERR_DATATYPE_NOT_UNIQUE           = $1046;
     PMERR_DATATYPE_TOO_LONG             = $1047;
     PMERR_DATATYPE_TOO_SMALL            = $1048;
     PMERR_DIRECTION_INVALID             = $1049;
     PMERR_INVALID_HAB                   = $104A;
     PMERR_INVALID_HSTRUCT               = $104D;
     PMERR_LENGTH_TOO_SMALL              = $104E;
     PMERR_MSGID_TOO_SMALL               = $104F;
     PMERR_NO_HANDLE_ALLOC               = $1050;
     PMERR_NOT_IN_A_PM_SESSION           = $1051;
     PMERR_MSG_QUEUE_ALREADY_EXISTS      = $1052;

     PMERR_OLD_RESOURCE                  = $1055;


{***********************************************************************
*
*            Window Manager error codes
*
* 2.) PMSHL error codes
*
***********************************************************************}

     PMERR_INVALID_PIB                = $1101;
     PMERR_INSUFF_SPACE_TO_ADD        = $1102;
     PMERR_INVALID_GROUP_HANDLE       = $1103;
     PMERR_DUPLICATE_TITLE            = $1104;
     PMERR_INVALID_TITLE              = $1105;
     PMERR_HANDLE_NOT_IN_GROUP        = $1107;
     PMERR_INVALID_TARGET_HANDLE      = $1106;
     PMERR_INVALID_PATH_STATEMENT     = $1108;
     PMERR_NO_PROGRAM_FOUND           = $1109;
     PMERR_INVALID_BUFFER_SIZE        = $110A;
     PMERR_BUFFER_TOO_SMALL           = $110B;
     PMERR_PL_INITIALISATION_FAIL     = $110C;
     PMERR_CANT_DESTROY_SYS_GROUP     = $110D;
     PMERR_INVALID_TYPE_CHANGE        = $110E;
     PMERR_INVALID_PROGRAM_HANDLE     = $110F;

     PMERR_NOT_CURRENT_PL_VERSION     = $1110;
     PMERR_INVALID_CIRCULAR_REF       = $1111;
     PMERR_MEMORY_ALLOCATION_ERR      = $1112;
     PMERR_MEMORY_DEALLOCATION_ERR    = $1113;
     PMERR_TASK_HEADER_TOO_BIG        = $1114;

     PMERR_INVALID_INI_FILE_HANDLE    = $1115;
     PMERR_MEMORY_SHARE               = $1116;
     PMERR_OPEN_QUEUE                 = $1117;
     PMERR_CREATE_QUEUE               = $1118;
     PMERR_WRITE_QUEUE                = $1119;
     PMERR_READ_QUEUE                 = $111A;
     PMERR_CALL_NOT_EXECUTED          = $111B;
     PMERR_UNKNOWN_APIPKT             = $111C;
     PMERR_INITHREAD_EXISTS           = $111D;
     PMERR_CREATE_THREAD              = $111E;
     PMERR_NO_HK_PROFILE_INSTALLED    = $111F;
     PMERR_INVALID_DIRECTORY          = $1120;
     PMERR_WILDCARD_IN_FILENAME       = $1121;
     PMERR_FILENAME_BUFFER_FULL       = $1122;
     PMERR_FILENAME_TOO_LONG          = $1123;
     PMERR_INI_FILE_IS_SYS_OR_USER    = $1124;
     PMERR_BROADCAST_PLMSG            = $1125;
     PMERR_190_INIT_DONE              = $1126;
     PMERR_HMOD_FOR_PMSHAPI           = $1127;
     PMERR_SET_HK_PROFILE             = $1128;
     PMERR_API_NOT_ALLOWED            = $1129;
     PMERR_INI_STILL_OPEN             = $112A;

     PMERR_PROGDETAILS_NOT_IN_INI     = $112B;
     PMERR_PIBSTRUCT_NOT_IN_INI       = $112C;
     PMERR_INVALID_DISKPROGDETAILS    = $112D;
     PMERR_PROGDETAILS_READ_FAILURE   = $112E;
     PMERR_PROGDETAILS_WRITE_FAILURE  = $112F;
     PMERR_PROGDETAILS_QSIZE_FAILURE  = $1130;
     PMERR_INVALID_PROGDETAILS        = $1131;
     PMERR_SHEPROFILEHOOK_NOT_FOUND   = $1132;
     PMERR_190PLCONVERTED             = $1133;
     PMERR_FAILED_TO_CONVERT_INI_PL   = $1134;
     PMERR_PMSHAPI_NOT_INITIALISED    = $1135;
     PMERR_INVALID_SHELL_API_HOOK_ID  = $1136;

     PMERR_DOS_ERROR                  = $1200;

     PMERR_NO_SPACE                   = $1201;
     PMERR_INVALID_SWITCH_HANDLE      = $1202;
     PMERR_NO_HANDLE                  = $1203;
     PMERR_INVALID_PROCESS_ID         = $1204;
     PMERR_NOT_SHELL                  = $1205;
     PMERR_INVALID_WINDOW             = $1206;
     PMERR_INVALID_POST_MSG           = $1207;
     PMERR_INVALID_PARAMETERS         = $1208;
     PMERR_INVALID_PROGRAM_TYPE       = $1209;
     PMERR_NOT_EXTENDED_FOCUS         = $120A;
     PMERR_INVALID_SESSION_ID         = $120B;
     PMERR_SMG_INVALID_ICON_FILE      = $120C;
     PMERR_SMG_ICON_NOT_CREATED       = $120D;
     PMERR_SHL_DEBUG                  = $120E;

     PMERR_OPENING_INI_FILE           = $1301;
     PMERR_INI_FILE_CORRUPT           = $1302;
     PMERR_INVALID_PARM               = $1303;
     PMERR_NOT_IN_IDX                 = $1304;
     PMERR_NO_ENTRIES_IN_GROUP        = $1305;

     PMERR_INI_WRITE_FAIL             = $1306;
     PMERR_IDX_FULL                   = $1307;
     PMERR_INI_PROTECTED              = $1308;
     PMERR_MEMORY_ALLOC               = $1309;
     PMERR_INI_INIT_ALREADY_DONE      = $130A;
     PMERR_INVALID_INTEGER            = $130B;
     PMERR_INVALID_ASCIIZ             = $130C;
     PMERR_CAN_NOT_CALL_SPOOLER       = $130D;
     PMERR_VALIDATION_REJECTED        = PMERR_CAN_NOT_CALL_SPOOLER;

     PMERR_WARNING_WINDOW_NOT_KILLED  = $1401;
     PMERR_ERROR_INVALID_WINDOW       = $1402;
     PMERR_ALREADY_INITIALIZED        = $1403;
     PMERR_MSG_PROG_NO_MOU            = $1405;
     PMERR_MSG_PROG_NON_RECOV         = $1406;
     PMERR_WINCONV_INVALID_PATH       = $1407;
     PMERR_PI_NOT_INITIALISED         = $1408;
     PMERR_PL_NOT_INITIALISED         = $1409;
     PMERR_NO_TASK_MANAGER            = $140A;
     PMERR_SAVE_NOT_IN_PROGRESS       = $140B;
     PMERR_NO_STACK_SPACE             = $140C;
     PMERR_INVALID_COLR_FIELD         = $140d;
     PMERR_INVALID_COLR_VALUE         = $140e;
     PMERR_COLR_WRITE                 = $140f;

     PMERR_TARGET_FILE_EXISTS         = $1501;
     PMERR_SOURCE_SAME_AS_TARGET      = $1502;
     PMERR_SOURCE_FILE_NOT_FOUND      = $1503;
     PMERR_INVALID_NEW_PATH           = $1504;
     PMERR_TARGET_FILE_NOT_FOUND      = $1505;
     PMERR_INVALID_DRIVE_NUMBER       = $1506;
     PMERR_NAME_TOO_LONG              = $1507;
     PMERR_NOT_ENOUGH_ROOM_ON_DISK    = $1508;
     PMERR_NOT_ENOUGH_MEM             = $1509;

     PMERR_LOG_DRV_DOES_NOT_EXIST     = $150B;
     PMERR_INVALID_DRIVE              = $150C;
     PMERR_ACCESS_DENIED              = $150D;
     PMERR_NO_FIRST_SLASH             = $150E;
     PMERR_READ_ONLY_FILE             = $150F;
     PMERR_GROUP_PROTECTED            = $151F;
     PMERR_INVALID_PROGRAM_CATEGORY   = $152F;
     PMERR_INVALID_APPL               = $1530;
     PMERR_CANNOT_START               = $1531;
     PMERR_STARTED_IN_BACKGROUND      = $1532;
     PMERR_INVALID_HAPP               = $1533;
     PMERR_CANNOT_STOP                = $1534;

     {**********************************************************************
     * Errors generated by Language Bindings layer.
     *
     * (Range $1600 thru $16FF reserved for Bindings)
     **********************************************************************}

     {** SEVERITY_UNRECOVERABLE **}
     PMERR_INTERNAL_ERROR_1           = $1601;
     PMERR_INTERNAL_ERROR_2           = $1602;
     PMERR_INTERNAL_ERROR_3           = $1603;
     PMERR_INTERNAL_ERROR_4           = $1604;
     PMERR_INTERNAL_ERROR_5           = $1605;
     PMERR_INTERNAL_ERROR_6           = $1606;
     PMERR_INTERNAL_ERROR_7           = $1607;
     PMERR_INTERNAL_ERROR_8           = $1608;
     PMERR_INTERNAL_ERROR_9           = $1609;
     PMERR_INTERNAL_ERROR_10          = $160A;
     PMERR_INTERNAL_ERROR_11          = $160B;
     PMERR_INTERNAL_ERROR_12          = $160C;
     PMERR_INTERNAL_ERROR_13          = $160D;
     PMERR_INTERNAL_ERROR_14          = $160E;
     PMERR_INTERNAL_ERROR_15          = $160F;
     PMERR_INTERNAL_ERROR_16          = $1610;
     PMERR_INTERNAL_ERROR_17          = $1611;
     PMERR_INTERNAL_ERROR_18          = $1612;
     PMERR_INTERNAL_ERROR_19          = $1613;
     PMERR_INTERNAL_ERROR_20          = $1614;
     PMERR_INTERNAL_ERROR_21          = $1615;
     PMERR_INTERNAL_ERROR_22          = $1616;
     PMERR_INTERNAL_ERROR_23          = $1617;
     PMERR_INTERNAL_ERROR_24          = $1618;
     PMERR_INTERNAL_ERROR_25          = $1619;
     PMERR_INTERNAL_ERROR_26          = $161A;
     PMERR_INTERNAL_ERROR_27          = $161B;
     PMERR_INTERNAL_ERROR_28          = $161C;
     PMERR_INTERNAL_ERROR_29          = $161D;

     {** SEVERITY_WARNING **}
     PMERR_INVALID_FREE_MESSAGE_ID    = $1630;

     {** SEVERITY_ERROR **}

     PMERR_FUNCTION_NOT_SUPPORTED     = $1641;
     PMERR_INVALID_ARRAY_COUNT        = $1642;
     PMERR_INVALID_LENGTH             = $1643;
     PMERR_INVALID_BUNDLE_TYPE        = $1644;
     PMERR_INVALID_PARAMETER          = $1645;
     PMERR_INVALID_NUMBER_OF_PARMS    = $1646;
     PMERR_GREATER_THAN_64K           = $1647;
     PMERR_INVALID_PARAMETER_TYPE     = $1648;
     PMERR_NEGATIVE_STRCOND_DIM       = $1649;
     PMERR_INVALID_NUMBER_OF_TYPES    = $164A;
     PMERR_INCORRECT_HSTRUCT          = $164B;
     PMERR_INVALID_ARRAY_SIZE         = $164C;
     PMERR_INVALID_CONTROL_DATATYPE   = $164D;
     PMERR_INCOMPLETE_CONTROL_SEQU    = $164E;
     PMERR_INVALID_DATATYPE           = $164F;
     PMERR_INCORRECT_DATATYPE         = $1650;
     PMERR_NOT_SELF_DESCRIBING_DTYP   = $1651;
     PMERR_INVALID_CTRL_SEQ_INDEX     = $1652;
     PMERR_INVALID_TYPE_FOR_LENGTH    = $1653;
     PMERR_INVALID_TYPE_FOR_OFFSET    = $1654;
     PMERR_INVALID_TYPE_FOR_MPARAM    = $1655;
     PMERR_INVALID_MESSAGE_ID         = $1656;
     PMERR_C_LENGTH_TOO_SMALL         = $1657;
     PMERR_APPL_STRUCTURE_TOO_SMALL   = $1658;
     PMERR_INVALID_ERRORINFO_HANDLE   = $1659;
     PMERR_INVALID_CHARACTER_INDEX    = $165A;

     {**********************************************************************
     * End of Errors generated by Language Bindings layer.
     *
     * (Range $1600 thru $16FF reserved for Bindings)
     **********************************************************************}

{***********************************************************************
*
*            Workplace Shell error codes
*
* PMWP error codes
*
***********************************************************************}

     WPERR_PROTECTED_CLASS            = $1700;
     WPERR_INVALID_CLASS              = $1701;
     WPERR_INVALID_SUPERCLASS         = $1702;
     WPERR_NO_MEMORY                  = $1703;
     WPERR_SEMAPHORE_ERROR            = $1704;
     WPERR_BUFFER_TOO_SMALL           = $1705;
     WPERR_CLSLOADMOD_FAILED          = $1706;
     WPERR_CLSPROCADDR_FAILED         = $1707;
     WPERR_OBJWORD_LOCATION           = $1708;
     WPERR_INVALID_OBJECT             = $1709;
     WPERR_MEMORY_CLEANUP             = $170A;
     WPERR_INVALID_MODULE             = $170B;
     WPERR_INVALID_OLDCLASS           = $170C;
     WPERR_INVALID_NEWCLASS           = $170D;
     WPERR_NOT_IMMEDIATE_CHILD        = $170E;
     WPERR_NOT_WORKPLACE_CLASS        = $170F;
     WPERR_CANT_REPLACE_METACLS       = $1710;
     WPERR_INI_FILE_WRITE             = $1711;
     WPERR_INVALID_FOLDER             = $1712;
     WPERR_BUFFER_OVERFLOW            = $1713;
     WPERR_OBJECT_NOT_FOUND           = $1714;
     WPERR_INVALID_HFIND              = $1715;
     WPERR_INVALID_COUNT              = $1716;
     WPERR_INVALID_BUFFER             = $1717;
     WPERR_ALREADY_EXISTS             = $1718;
     WPERR_INVALID_FLAGS              = $1719;
     WPERR_INVALID_OBJECTID           = $1720;


{********************************************************************
*** GPI error codes
********************************************************************}

     { AAB error codes for the GPI }
     PMERR_OK                           = $0000;
     PMERR_ALREADY_IN_AREA              = $2001;
     PMERR_ALREADY_IN_ELEMENT           = $2002;
     PMERR_ALREADY_IN_PATH              = $2003;
     PMERR_ALREADY_IN_SEG               = $2004;
     PMERR_AREA_INCOMPLETE              = $2005;
     PMERR_BASE_ERROR                   = $2006;
     PMERR_BITBLT_LENGTH_EXCEEDED       = $2007;
     PMERR_BITMAP_IN_USE                = $2008;
     PMERR_BITMAP_IS_SELECTED           = $2009;
     PMERR_BITMAP_NOT_FOUND             = $200A;
     PMERR_BITMAP_NOT_SELECTED          = $200B;
     PMERR_BOUNDS_OVERFLOW              = $200C;
     PMERR_CALLED_SEG_IS_CHAINED        = $200D;
     PMERR_CALLED_SEG_IS_CURRENT        = $200E;
     PMERR_CALLED_SEG_NOT_FOUND         = $200F;
     PMERR_CANNOT_DELETE_ALL_DATA       = $2010;
     PMERR_CANNOT_REPLACE_ELEMENT_0     = $2011;
     PMERR_COL_TABLE_NOT_REALIZABLE     = $2012;
     PMERR_COL_TABLE_NOT_REALIZED       = $2013;
     PMERR_COORDINATE_OVERFLOW          = $2014;
     PMERR_CORR_FORMAT_MISMATCH         = $2015;
     PMERR_DATA_TOO_LONG                = $2016;
     PMERR_DC_IS_ASSOCIATED             = $2017;
     PMERR_DESC_STRING_TRUNCATED        = $2018;
     PMERR_DEVICE_DRIVER_ERROR_1        = $2019;
     PMERR_DEVICE_DRIVER_ERROR_2        = $201A;
     PMERR_DEVICE_DRIVER_ERROR_3        = $201B;
     PMERR_DEVICE_DRIVER_ERROR_4        = $201C;
     PMERR_DEVICE_DRIVER_ERROR_5        = $201D;
     PMERR_DEVICE_DRIVER_ERROR_6        = $201E;
     PMERR_DEVICE_DRIVER_ERROR_7        = $201F;
     PMERR_DEVICE_DRIVER_ERROR_8        = $2020;
     PMERR_DEVICE_DRIVER_ERROR_9        = $2021;
     PMERR_DEVICE_DRIVER_ERROR_10       = $2022;
     PMERR_DEV_FUNC_NOT_INSTALLED       = $2023;
     PMERR_DOSOPEN_FAILURE              = $2024;
     PMERR_DOSREAD_FAILURE              = $2025;
     PMERR_DRIVER_NOT_FOUND             = $2026;
     PMERR_DUP_SEG                      = $2027;
     PMERR_DYNAMIC_SEG_SEQ_ERROR        = $2028;
     PMERR_DYNAMIC_SEG_ZERO_INV         = $2029;
     PMERR_ELEMENT_INCOMPLETE           = $202A;
     PMERR_ESC_CODE_NOT_SUPPORTED       = $202B;
     PMERR_EXCEEDS_MAX_SEG_LENGTH       = $202C;
     PMERR_FONT_AND_MODE_MISMATCH       = $202D;
     PMERR_FONT_FILE_NOT_LOADED         = $202E;
     PMERR_FONT_NOT_LOADED              = $202F;
     PMERR_FONT_TOO_BIG                 = $2030;
     PMERR_HARDWARE_INIT_FAILURE        = $2031;
     PMERR_HBITMAP_BUSY                 = $2032;
     PMERR_HDC_BUSY                     = $2033;
     PMERR_HRGN_BUSY                    = $2034;
     PMERR_HUGE_FONTS_NOT_SUPPORTED     = $2035;
     PMERR_ID_HAS_NO_BITMAP             = $2036;
     PMERR_IMAGE_INCOMPLETE             = $2037;
     PMERR_INCOMPAT_COLOR_FORMAT        = $2038;
     PMERR_INCOMPAT_COLOR_OPTIONS       = $2039;
     PMERR_INCOMPATIBLE_BITMAP          = $203A;
     PMERR_INCOMPATIBLE_METAFILE        = $203B;
     PMERR_INCORRECT_DC_TYPE            = $203C;
     PMERR_INSUFFICIENT_DISK_SPACE      = $203D;
     PMERR_INSUFFICIENT_MEMORY          = $203E;
     PMERR_INV_ANGLE_PARM               = $203F;
     PMERR_INV_ARC_CONTROL              = $2040;
     PMERR_INV_AREA_CONTROL             = $2041;
     PMERR_INV_ARC_POINTS               = $2042;
     PMERR_INV_ATTR_MODE                = $2043;
     PMERR_INV_BACKGROUND_COL_ATTR      = $2044;
     PMERR_INV_BACKGROUND_MIX_ATTR      = $2045;
     PMERR_INV_BITBLT_MIX               = $2046;
     PMERR_INV_BITBLT_STYLE             = $2047;
     PMERR_INV_BITMAP_DIMENSION         = $2048;
     PMERR_INV_BOX_CONTROL              = $2049;
     PMERR_INV_BOX_ROUNDING_PARM        = $204A;
     PMERR_INV_CHAR_ANGLE_ATTR          = $204B;
     PMERR_INV_CHAR_DIRECTION_ATTR      = $204C;
     PMERR_INV_CHAR_MODE_ATTR           = $204D;
     PMERR_INV_CHAR_POS_OPTIONS         = $204E;
     PMERR_INV_CHAR_SET_ATTR            = $204F;
     PMERR_INV_CHAR_SHEAR_ATTR          = $2050;
     PMERR_INV_CLIP_PATH_OPTIONS        = $2051;
     PMERR_INV_CODEPAGE                 = $2052;
     PMERR_INV_COLOR_ATTR               = $2053;
     PMERR_INV_COLOR_DATA               = $2054;
     PMERR_INV_COLOR_FORMAT             = $2055;
     PMERR_INV_COLOR_INDEX              = $2056;
     PMERR_INV_COLOR_OPTIONS            = $2057;
     PMERR_INV_COLOR_START_INDEX        = $2058;
     PMERR_INV_COORD_OFFSET             = $2059;
     PMERR_INV_COORD_SPACE              = $205A;
     PMERR_INV_COORDINATE               = $205B;
     PMERR_INV_CORRELATE_DEPTH          = $205C;
     PMERR_INV_CORRELATE_TYPE           = $205D;
     PMERR_INV_CURSOR_BITMAP            = $205E;
     PMERR_INV_DC_DATA                  = $205F;
     PMERR_INV_DC_TYPE                  = $2060;
     PMERR_INV_DEVICE_NAME              = $2061;
     PMERR_INV_DEV_MODES_OPTIONS        = $2062;
     PMERR_INV_DRAW_CONTROL             = $2063;
     PMERR_INV_DRAW_VALUE               = $2064;
     PMERR_INV_DRAWING_MODE             = $2065;
     PMERR_INV_DRIVER_DATA              = $2066;
     PMERR_INV_DRIVER_NAME              = $2067;
     PMERR_INV_DRAW_BORDER_OPTION       = $2068;
     PMERR_INV_EDIT_MODE                = $2069;
     PMERR_INV_ELEMENT_OFFSET           = $206A;
     PMERR_INV_ELEMENT_POINTER          = $206B;
     PMERR_INV_END_PATH_OPTIONS         = $206C;
     PMERR_INV_ESC_CODE                 = $206D;
     PMERR_INV_ESCAPE_DATA              = $206E;
     PMERR_INV_EXTENDED_LCID            = $206F;
     PMERR_INV_FILL_PATH_OPTIONS        = $2070;
     PMERR_INV_FIRST_CHAR               = $2071;
     PMERR_INV_FONT_ATTRS               = $2072;
     PMERR_INV_FONT_FILE_DATA           = $2073;
     PMERR_INV_FOR_THIS_DC_TYPE         = $2074;
     PMERR_INV_FORMAT_CONTROL           = $2075;
     PMERR_INV_FORMS_CODE               = $2076;
     PMERR_INV_FONTDEF                  = $2077;
     PMERR_INV_GEOM_LINE_WIDTH_ATTR     = $2078;
     PMERR_INV_GETDATA_CONTROL          = $2079;
     PMERR_INV_GRAPHICS_FIELD           = $207A;
     PMERR_INV_HBITMAP                  = $207B;
     PMERR_INV_HDC                      = $207C;
     PMERR_INV_HJOURNAL                 = $207D;
     PMERR_INV_HMF                      = $207E;
     PMERR_INV_HPS                      = $207F;
     PMERR_INV_HRGN                     = $2080;
     PMERR_INV_ID                       = $2081;
     PMERR_INV_IMAGE_DATA_LENGTH        = $2082;
     PMERR_INV_IMAGE_DIMENSION          = $2083;
     PMERR_INV_IMAGE_FORMAT             = $2084;
     PMERR_INV_IN_AREA                  = $2085;
     PMERR_INV_IN_CALLED_SEG            = $2086;
     PMERR_INV_IN_CURRENT_EDIT_MODE     = $2087;
     PMERR_INV_IN_DRAW_MODE             = $2088;
     PMERR_INV_IN_ELEMENT               = $2089;
     PMERR_INV_IN_IMAGE                 = $208A;
     PMERR_INV_IN_PATH                  = $208B;
     PMERR_INV_IN_RETAIN_MODE           = $208C;
     PMERR_INV_IN_SEG                   = $208D;
     PMERR_INV_IN_VECTOR_SYMBOL         = $208E;
     PMERR_INV_INFO_TABLE               = $208F;
     PMERR_INV_JOURNAL_OPTION           = $2090;
     PMERR_INV_KERNING_FLAGS            = $2091;
     PMERR_INV_LENGTH_OR_COUNT          = $2092;
     PMERR_INV_LINE_END_ATTR            = $2093;
     PMERR_INV_LINE_JOIN_ATTR           = $2094;
     PMERR_INV_LINE_TYPE_ATTR           = $2095;
     PMERR_INV_LINE_WIDTH_ATTR          = $2096;
     PMERR_INV_LOGICAL_ADDRESS          = $2097;
     PMERR_INV_MARKER_BOX_ATTR          = $2098;
     PMERR_INV_MARKER_SET_ATTR          = $2099;
     PMERR_INV_MARKER_SYMBOL_ATTR       = $209A;
     PMERR_INV_MATRIX_ELEMENT           = $209B;
     PMERR_INV_MAX_HITS                 = $209C;
     PMERR_INV_METAFILE                 = $209D;
     PMERR_INV_METAFILE_LENGTH          = $209E;
     PMERR_INV_METAFILE_OFFSET          = $209F;
     PMERR_INV_MICROPS_DRAW_CONTROL     = $20A0;
     PMERR_INV_MICROPS_FUNCTION         = $20A1;
     PMERR_INV_MICROPS_ORDER            = $20A2;
     PMERR_INV_MIX_ATTR                 = $20A3;
     PMERR_INV_MODE_FOR_OPEN_DYN        = $20A4;
     PMERR_INV_MODE_FOR_REOPEN_SEG      = $20A5;
     PMERR_INV_MODIFY_PATH_MODE         = $20A6;
     PMERR_INV_MULTIPLIER               = $20A7;
     PMERR_INV_NESTED_FIGURES           = $20A8;
     PMERR_INV_OR_INCOMPAT_OPTIONS      = $20A9;
     PMERR_INV_ORDER_LENGTH             = $20AA;
     PMERR_INV_ORDERING_PARM            = $20AB;
     PMERR_INV_OUTSIDE_DRAW_MODE        = $20AC;
     PMERR_INV_PAGE_VIEWPORT            = $20AD;
     PMERR_INV_PATH_ID                  = $20AE;
     PMERR_INV_PATH_MODE                = $20AF;
     PMERR_INV_PATTERN_ATTR             = $20B0;
     PMERR_INV_PATTERN_REF_PT_ATTR      = $20B1;
     PMERR_INV_PATTERN_SET_ATTR         = $20B2;
     PMERR_INV_PATTERN_SET_FONT         = $20B3;
     PMERR_INV_PICK_APERTURE_OPTION     = $20B4;
     PMERR_INV_PICK_APERTURE_POSN       = $20B5;
     PMERR_INV_PICK_APERTURE_SIZE       = $20B6;
     PMERR_INV_PICK_NUMBER              = $20B7;
     PMERR_INV_PLAY_METAFILE_OPTION     = $20B8;
     PMERR_INV_PRIMITIVE_TYPE           = $20B9;
     PMERR_INV_PS_SIZE                  = $20BA;
     PMERR_INV_PUTDATA_FORMAT           = $20BB;
     PMERR_INV_QUERY_ELEMENT_NO         = $20BC;
     PMERR_INV_RECT                     = $20BD;
     PMERR_INV_REGION_CONTROL           = $20BE;
     PMERR_INV_REGION_MIX_MODE          = $20BF;
     PMERR_INV_REPLACE_MODE_FUNC        = $20C0;
     PMERR_INV_RESERVED_FIELD           = $20C1;
     PMERR_INV_RESET_OPTIONS            = $20C2;
     PMERR_INV_RGBCOLOR                 = $20C3;
     PMERR_INV_SCAN_START               = $20C4;
     PMERR_INV_SEG_ATTR                 = $20C5;
     PMERR_INV_SEG_ATTR_VALUE           = $20C6;
     PMERR_INV_SEG_CH_LENGTH            = $20C7;
     PMERR_INV_SEG_NAME                 = $20C8;
     PMERR_INV_SEG_OFFSET               = $20C9;
     PMERR_INV_SETID                    = $20CA;
     PMERR_INV_SETID_TYPE               = $20CB;
     PMERR_INV_SET_VIEWPORT_OPTION      = $20CC;
     PMERR_INV_SHARPNESS_PARM           = $20CD;
     PMERR_INV_SOURCE_OFFSET            = $20CE;
     PMERR_INV_STOP_DRAW_VALUE          = $20CF;
     PMERR_INV_TRANSFORM_TYPE           = $20D0;
     PMERR_INV_USAGE_PARM               = $20D1;
     PMERR_INV_VIEWING_LIMITS           = $20D2;
     PMERR_JFILE_BUSY                   = $20D3;
     PMERR_JNL_FUNC_DATA_TOO_LONG       = $20D4;
     PMERR_KERNING_NOT_SUPPORTED        = $20D5;
     PMERR_LABEL_NOT_FOUND              = $20D6;
     PMERR_MATRIX_OVERFLOW              = $20D7;
     PMERR_METAFILE_INTERNAL_ERROR      = $20D8;
     PMERR_METAFILE_IN_USE              = $20D9;
     PMERR_METAFILE_LIMIT_EXCEEDED      = $20DA;
     PMERR_NAME_STACK_FULL              = $20DB;
     PMERR_NOT_CREATED_BY_DEVOPENDC     = $20DC;
     PMERR_NOT_IN_AREA                  = $20DD;
     PMERR_NOT_IN_DRAW_MODE             = $20DE;
     PMERR_NOT_IN_ELEMENT               = $20DF;
     PMERR_NOT_IN_IMAGE                 = $20E0;
     PMERR_NOT_IN_PATH                  = $20E1;
     PMERR_NOT_IN_RETAIN_MODE           = $20E2;
     PMERR_NOT_IN_SEG                   = $20E3;
     PMERR_NO_BITMAP_SELECTED           = $20E4;
     PMERR_NO_CURRENT_ELEMENT           = $20E5;
     PMERR_NO_CURRENT_SEG               = $20E6;
     PMERR_NO_METAFILE_RECORD_HANDLE    = $20E7;
     PMERR_ORDER_TOO_BIG                = $20E8;
     PMERR_OTHER_SET_ID_REFS            = $20E9;
     PMERR_OVERRAN_SEG                  = $20EA;
     PMERR_OWN_SET_ID_REFS              = $20EB;
     PMERR_PATH_INCOMPLETE              = $20EC;
     PMERR_PATH_LIMIT_EXCEEDED          = $20ED;
     PMERR_PATH_UNKNOWN                 = $20EE;
     PMERR_PEL_IS_CLIPPED               = $20EF;
     PMERR_PEL_NOT_AVAILABLE            = $20F0;
     PMERR_PRIMITIVE_STACK_EMPTY        = $20F1;
     PMERR_PROLOG_ERROR                 = $20F2;
     PMERR_PROLOG_SEG_ATTR_NOT_SET      = $20F3;
     PMERR_PS_BUSY                      = $20F4;
     PMERR_PS_IS_ASSOCIATED             = $20F5;
     PMERR_RAM_JNL_FILE_TOO_SMALL       = $20F6;
     PMERR_REALIZE_NOT_SUPPORTED        = $20F7;
     PMERR_REGION_IS_CLIP_REGION        = $20F8;
     PMERR_RESOURCE_DEPLETION           = $20F9;
     PMERR_SEG_AND_REFSEG_ARE_SAME      = $20FA;
     PMERR_SEG_CALL_RECURSIVE           = $20FB;
     PMERR_SEG_CALL_STACK_EMPTY         = $20FC;
     PMERR_SEG_CALL_STACK_FULL          = $20FD;
     PMERR_SEG_IS_CURRENT               = $20FE;
     PMERR_SEG_NOT_CHAINED              = $20FF;
     PMERR_SEG_NOT_FOUND                = $2100;
     PMERR_SEG_STORE_LIMIT_EXCEEDED     = $2101;
     PMERR_SETID_IN_USE                 = $2102;
     PMERR_SETID_NOT_FOUND              = $2103;
     PMERR_STARTDOC_NOT_ISSUED          = $2104;
     PMERR_STOP_DRAW_OCCURRED           = $2105;
     PMERR_TOO_MANY_METAFILES_IN_USE    = $2106;
     PMERR_TRUNCATED_ORDER              = $2107;
     PMERR_UNCHAINED_SEG_ZERO_INV       = $2108;
     PMERR_UNSUPPORTED_ATTR             = $2109;
     PMERR_UNSUPPORTED_ATTR_VALUE       = $210A;
     PMERR_ENDDOC_NOT_ISSUED            = $210B;
     PMERR_PS_NOT_ASSOCIATED            = $210C;
     PMERR_INV_FLOOD_FILL_OPTIONS       = $210D;
     PMERR_INV_FACENAME                 = $210E;
     PMERR_PALETTE_SELECTED             = $210F;
     PMERR_NO_PALETTE_SELECTED          = $2110;
     PMERR_INV_HPAL                     = $2111;
     PMERR_PALETTE_BUSY                 = $2112;
     PMERR_START_POINT_CLIPPED          = $2113;
     PMERR_NO_FILL                      = $2114;
     PMERR_INV_FACENAMEDESC             = $2115;
     PMERR_INV_BITMAP_DATA              = $2116;
     PMERR_INV_CHAR_ALIGN_ATTR          = $2117;
     PMERR_INV_HFONT                    = $2118;
     PMERR_HFONT_IS_SELECTED            = $2119;
     PMERR_DRVR_NOT_SUPPORTED           = $2120;


{****************************************************************************
*** Device Manager error codes
****************************************************************************}

{ None yet }


{****************************************************************************
*** Spooler error codes
****************************************************************************}

     PMERR_SPL_DRIVER_ERROR             = $4001;
     PMERR_SPL_DEVICE_ERROR             = $4002;
     PMERR_SPL_DEVICE_NOT_INSTALLED     = $4003;
     PMERR_SPL_QUEUE_ERROR              = $4004;
     PMERR_SPL_INV_HSPL                 = $4005;
     PMERR_SPL_NO_DISK_SPACE            = $4006;
     PMERR_SPL_NO_MEMORY                = $4007;
     PMERR_SPL_PRINT_ABORT              = $4008;
     PMERR_SPL_SPOOLER_NOT_INSTALLED    = $4009;
     PMERR_SPL_INV_FORMS_CODE           = $400A;
     PMERR_SPL_INV_PRIORITY             = $400B;
     PMERR_SPL_NO_FREE_JOB_ID           = $400C;
     PMERR_SPL_NO_DATA                  = $400D;
     PMERR_SPL_INV_TOKEN                = $400E;
     PMERR_SPL_INV_DATATYPE             = $400F;
     PMERR_SPL_PROCESSOR_ERROR          = $4010;
     PMERR_SPL_INV_JOB_ID               = $4011;
     PMERR_SPL_JOB_NOT_PRINTING         = $4012;
     PMERR_SPL_JOB_PRINTING             = $4013;
     PMERR_SPL_QUEUE_ALREADY_EXISTS     = $4014;
     PMERR_SPL_INV_QUEUE_NAME           = $4015;
     PMERR_SPL_QUEUE_NOT_EMPTY          = $4016;
     PMERR_SPL_DEVICE_ALREADY_EXISTS    = $4017;
     PMERR_SPL_DEVICE_LIMIT_REACHED     = $4018;
     PMERR_SPL_STATUS_STRING_TRUNC      = $4019;
     PMERR_SPL_INV_LENGTH_OR_COUNT      = $401A;
     PMERR_SPL_FILE_NOT_FOUND           = $401B;
     PMERR_SPL_CANNOT_OPEN_FILE         = $401C;
     PMERR_SPL_DRIVER_NOT_INSTALLED     = $401D;
     PMERR_SPL_INV_PROCESSOR_DATTYPE    = $401E;
     PMERR_SPL_INV_DRIVER_DATATYPE      = $401F;
     PMERR_SPL_PROCESSOR_NOT_INST       = $4020;
     PMERR_SPL_NO_SUCH_LOG_ADDRESS      = $4021;
     PMERR_SPL_PRINTER_NOT_FOUND        = $4022;
     PMERR_SPL_DD_NOT_FOUND             = $4023;
     PMERR_SPL_QUEUE_NOT_FOUND          = $4024;
     PMERR_SPL_MANY_QUEUES_ASSOC        = $4025;
     PMERR_SPL_NO_QUEUES_ASSOCIATED     = $4026;
     PMERR_SPL_INI_FILE_ERROR           = $4027;
     PMERR_SPL_NO_DEFAULT_QUEUE         = $4028;
     PMERR_SPL_NO_CURRENT_FORMS_CODE    = $4029;
     PMERR_SPL_NOT_AUTHORISED           = $402A;
     PMERR_SPL_TEMP_NETWORK_ERROR       = $402B;
     PMERR_SPL_HARD_NETWORK_ERROR       = $402C;
     PMERR_DEL_NOT_ALLOWED              = $402D;
     PMERR_CANNOT_DEL_QP_REF            = $402E;
     PMERR_CANNOT_DEL_QNAME_REF         = $402F;
     PMERR_CANNOT_DEL_PRINTER_DD_REF    = $4030;
     PMERR_CANNOT_DEL_PRN_NAME_REF      = $4031;
     PMERR_CANNOT_DEL_PRN_ADDR_REF      = $4032;
     PMERR_SPOOLER_QP_NOT_DEFINED       = $4033;
     PMERR_PRN_NAME_NOT_DEFINED         = $4034;
     PMERR_PRN_ADDR_NOT_DEFINED         = $4035;
     PMERR_PRINTER_DD_NOT_DEFINED       = $4036;
     PMERR_PRINTER_QUEUE_NOT_DEFINED    = $4037;
     PMERR_PRN_ADDR_IN_USE              = $4038;
     PMERR_SPL_TOO_MANY_OPEN_FILES      = $4039;
     PMERR_SPL_CP_NOT_REQD              = $403A;
     PMERR_UNABLE_TO_CLOSE_DEVICE       = $4040;

     PMERR_SPL_ERROR_1           = SPLERR_BASE + 4001;
     PMERR_SPL_ERROR_2           = SPLERR_BASE + 4002;
     PMERR_SPL_ERROR_3           = SPLERR_BASE + 4003;
     PMERR_SPL_ERROR_4           = SPLERR_BASE + 4004;
     PMERR_SPL_ERROR_5           = SPLERR_BASE + 4005;
     PMERR_SPL_ERROR_6           = SPLERR_BASE + 4006;
     PMERR_SPL_ERROR_7           = SPLERR_BASE + 4007;
     PMERR_SPL_ERROR_8           = SPLERR_BASE + 4008;
     PMERR_SPL_ERROR_9           = SPLERR_BASE + 4009;
     PMERR_SPL_ERROR_10          = SPLERR_BASE + 4010;
     PMERR_SPL_ERROR_11          = SPLERR_BASE + 4011;
     PMERR_SPL_ERROR_12          = SPLERR_BASE + 4012;
     PMERR_SPL_ERROR_13          = SPLERR_BASE + 4013;
     PMERR_SPL_ERROR_14          = SPLERR_BASE + 4014;
     PMERR_SPL_ERROR_15          = SPLERR_BASE + 4015;
     PMERR_SPL_ERROR_16          = SPLERR_BASE + 4016;
     PMERR_SPL_ERROR_17          = SPLERR_BASE + 4017;
     PMERR_SPL_ERROR_18          = SPLERR_BASE + 4018;
     PMERR_SPL_ERROR_19          = SPLERR_BASE + 4019;
     PMERR_SPL_ERROR_20          = SPLERR_BASE + 4020;
     PMERR_SPL_ERROR_21          = SPLERR_BASE + 4021;
     PMERR_SPL_ERROR_22          = SPLERR_BASE + 4022;
     PMERR_SPL_ERROR_23          = SPLERR_BASE + 4023;
     PMERR_SPL_ERROR_24          = SPLERR_BASE + 4024;
     PMERR_SPL_ERROR_25          = SPLERR_BASE + 4025;
     PMERR_SPL_ERROR_26          = SPLERR_BASE + 4026;
     PMERR_SPL_ERROR_27          = SPLERR_BASE + 4027;
     PMERR_SPL_ERROR_28          = SPLERR_BASE + 4028;
     PMERR_SPL_ERROR_29          = SPLERR_BASE + 4029;
     PMERR_SPL_ERROR_30          = SPLERR_BASE + 4030;
     PMERR_SPL_ERROR_31          = SPLERR_BASE + 4031;
     PMERR_SPL_ERROR_32          = SPLERR_BASE + 4032;
     PMERR_SPL_ERROR_33          = SPLERR_BASE + 4033;
     PMERR_SPL_ERROR_34          = SPLERR_BASE + 4034;
     PMERR_SPL_ERROR_35          = SPLERR_BASE + 4035;
     PMERR_SPL_ERROR_36          = SPLERR_BASE + 4036;
     PMERR_SPL_ERROR_37          = SPLERR_BASE + 4037;
     PMERR_SPL_ERROR_38          = SPLERR_BASE + 4038;
     PMERR_SPL_ERROR_39          = SPLERR_BASE + 4039;
     PMERR_SPL_ERROR_40          = SPLERR_BASE + 4040;

     PMERR_SPLMSGBOX_INFO_CAPTION     = SPLERR_BASE + 4041;
     PMERR_SPLMSGBOX_WARNING_CAPTION  = SPLERR_BASE + 4042;
     PMERR_SPLMSGBOX_ERROR_CAPTION    = SPLERR_BASE + 4043;
     PMERR_SPLMSGBOX_SEVERE_CAPTION   = SPLERR_BASE + 4044;

     PMERR_SPLMSGBOX_JOB_DETAILS      = SPLERR_BASE + 4045;

     PMERR_SPLMSGBOX_ERROR_ACTION     = SPLERR_BASE + 4046;
     PMERR_SPLMSGBOX_SEVERE_ACTION    = SPLERR_BASE + 4047;

     PMERR_SPLMSGBOX_BIT_0_TEXT       = SPLERR_BASE + 4048;
     PMERR_SPLMSGBOX_BIT_1_TEXT       = SPLERR_BASE + 4049;
     PMERR_SPLMSGBOX_BIT_2_TEXT       = SPLERR_BASE + 4050;
     PMERR_SPLMSGBOX_BIT_3_TEXT       = SPLERR_BASE + 4051;
     PMERR_SPLMSGBOX_BIT_4_TEXT       = SPLERR_BASE + 4052;
     PMERR_SPLMSGBOX_BIT_5_TEXT       = SPLERR_BASE + 4053;
     PMERR_SPLMSGBOX_BIT_15_TEXT      = SPLERR_BASE + 4054;
     PMERR_SPL_NOPATHBUFFER           = SPLERR_BASE + 4055;

     PMERR_SPL_ALREADY_INITIALISED    = SPLERR_BASE + 4093;
     PMERR_SPL_ERROR                  = SPLERR_BASE + 4095;

     NERR_BASE                = 2100;
     NERR_NetNotStarted       = NERR_BASE + 2;   { The NETWKSTA.SYS workstation driver isn't installed. }
     NERR_RedirectedPath      = NERR_BASE + 17;  { The operation is invalid on a redirected resource. }
     NERR_BufTooSmall         = NERR_BASE + 23;  { The API return buffer is too small. }
     NERR_InvalidAPI          = NERR_BASE + 42;  { The requested API isn't supported on the remote server. }
     NERR_QNotFound           = NERR_BASE + 50;  { The printer queue does not exist. }
     NERR_JobNotFound         = NERR_BASE + 51;  { The print job does not exist. }
     NERR_DestNotFound        = NERR_BASE + 52;  { The printer destination cannot be found. }
     NERR_DestExists          = NERR_BASE + 53;  { The printer destination already exists. }
     NERR_QExists             = NERR_BASE + 54;  { The printer queue already exists. }
     NERR_QNoRoom             = NERR_BASE + 55;  { No more printer queues can be added. }
     NERR_JobNoRoom           = NERR_BASE + 56;  { No more print jobs can be added.  }
     NERR_DestNoRoom          = NERR_BASE + 57;  { No more printer destinations can be added. }
     NERR_DestIdle            = NERR_BASE + 58;  { This printer destination is idle and cannot accept control operations. }
     NERR_DestInvalidOp       = NERR_BASE + 59;  { This printer destination request contains an invalid control function. }
     NERR_SpoolerNotLoaded    = NERR_BASE + 61;  { The spooler is not running. }
     NERR_DestInvalidState    = NERR_BASE + 62;  { This operation cannot be performed on the print destination in its current state. }
     NERR_JobInvalidState     = NERR_BASE + 64;  { This operation cannot be performed on the print job in its current state. }
     NERR_SpoolNoMemory       = NERR_BASE + 65;  { A spooler memory allocation failure occurred. }
     NERR_DriverNotFound      = NERR_BASE + 66;  { The device driver does not exist. }
     NERR_DataTypeInvalid     = NERR_BASE + 67;  { The datatype is not supported by the processor. }
     NERR_ProcNotFound        = NERR_BASE + 68;  { The print processor is not installed. }
     NERR_BadDev              = NERR_BASE + 241; { The requested device is invalid. }
     NERR_CommDevInUse        = NERR_BASE + 243; { This device is already in use as a communications device. }
     NERR_InvalidComputer     = NERR_BASE + 251; { This computername is invalid. }
     NERR_OpenFiles           = NERR_BASE + 301; { There are open files on the connection.    }
     NERR_LocalDrive          = NERR_BASE + 305; { The drive letter is in use locally. }


{****************************************************************************
*** Picture Utilities error codes
****************************************************************************}

     PMERR_INV_TYPE         = $5001;
     PMERR_INV_CONV         = $5002;
     PMERR_INV_SEGLEN       = $5003;
     PMERR_DUP_SEGNAME      = $5004;
     PMERR_INV_XFORM        = $5005;
     PMERR_INV_VIEWLIM      = $5006;
     PMERR_INV_3DCOORD      = $5007;
     PMERR_SMB_OVFLOW       = $5008;
     PMERR_SEG_OVFLOW       = $5009;
     PMERR_PIC_DUP_FILENAME = $5010;


{****************************************************************************
*    numbers from $5100 to $5fff are reserved.
****************************************************************************}

IMPLEMENTATION

BEGIN
END.
