#include <wx/stc/stc.h>
#include <wx/string.h>

extern "C" {
    void wxStyledTextCtrl_MarginSetText(void*,int,wxString*);
}

void wxStyledTextCtrl_MarginSetText(void* _obj,int pos,wxString* text)
{
   ((wxStyledTextCtrl*) _obj)->MarginSetText(pos, *text);
}

