; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Filename: FoxitReader,reload.ahk
; Author: Henrik Bengtsson, hb at biostat.ucsf.edu
; Version: 1.0.5
; Created on: 2009-08-29
; Last updated on: 2011-04-25
; Licence: LGPL v2.1 or newer
;
; Description:
; An AutoHotkey [1] script that reloads the current PDF document
; in Foxit Reader when the user press Left Ctrl-R.
;
; Details:
; If the Foxit Reader is active, it first sends 'Ctrl-W' to close
; the currently open PDF, then 'Alt-F' and '1' to open the most
; recently opened/viewed PDF.
;
; Known issues:
; Note that the script reopens the most recently opened PDF.  Thus,
; if you open several PDFs in the same Foxit Reader and use the
; Window menu to navigate between them, then the currently viewed
; PDF is not necessarily the same as the most recently opened one.
; A workaround is to open each PDF in a separate Foxit Reader
; session (see below).
;
; Installation:
; (1) Install AutoHotkey [1].
; (2) Save this script on your local drive.
; (3) To start it with Windows: Drag it to the Windows Startup menu.
; (4) In Preferences of FoxitReader, under 'History', (i) check
;     '[x] Restore last view settings when reopening', and (ii) make
;     sure 'Maximum number of documents in recently used list: [ ]'
;     is set to at least one.  You may also want to check '[ ] Allow
;     multiple Instances' under 'Documents' in order to open one
;     Foxit Reader per PDF.
;
; Note: To start it once, double click on the script file.
;
; Known issues:
; Sometimes this script stops working and it has to be reloaded
; in order to work again.
;
; References;
; [1] AutoHotkey for Windows, http://www.autohotkey.com/
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#SingleInstance force

#IfWinActive ahk_class classFoxitReader
LControl & r::
        Send ^w
        Send !f
        Send 1
        return

LControl & t::
        MsgBox DEBUG: You pressed LCtrl+T
        Send ^w
        Send !f
        Send 1
        return
#IfWinActive


; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; HISTORY
; 2011-04-25 [v1.0.5]
; o Update such that it is only *Left* Control + R that reloads
;   the document.
; 2009-10-28 [v1.0.4]
; o Slight update to the above help comment.
; 2009-08-29 [v1.0.3]
; o Now the test that the active window is a Foxit Reader window,
;   is done using the 'ahk_class' property rather than matching
;   against the window title. Using the latter, would also assign the
;   hotkey to say Firefox windows with 'Foxit Reader' in the title.
; 2009-08-28 [v1.0.2]
; o BUG FIX: Now Ctrl-R is only set for Foxit Reader and should not
;   affect other windows or processes.
; 2009-08-28 [v1.0.1]
; o BUG FIX: Forgot curly brackets so Ctrl-R was applied to all
;   windows, not just Foxit Reader.
; 2009-08-28 [v1.0.0]
; o Created.
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
