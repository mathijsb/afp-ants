#include <wx/stc/stc.h>
#include <wx/string.h>
#include <wx/fontenum.h>

extern "C" {
    void wxStyledTextCtrl_MarginSetText(void*,int,wxString*);
    wxString* find_fixed_font_face();
}

void wxStyledTextCtrl_MarginSetText(void* _obj,int pos,wxString* text)
{
   ((wxStyledTextCtrl*) _obj)->MarginSetText(pos, *text);
}

class firstFontEnumerator : public wxFontEnumerator
{
public:
    wxString foundFace;
    firstFontEnumerator() {}
        
    virtual bool OnFacename(const wxString& facename)
    {
        foundFace = facename;
        return false;
    }
};

wxString* find_fixed_font_face()
{
   firstFontEnumerator e;
   wxString* result = new wxString();
   // First try the system default (if defined).
   if (e.IsValidFacename(wxString("monospace")))
   {
        *result = wxString("monospace");
   }
   // Mac specifics
   else if (e.IsValidFacename(wxString("Osaka")))
   {
        *result = wxString("Osaka");
   }
   else if (e.IsValidFacename(wxString("Monaco")))
   {
        *result = wxString("Monaco");
   }
   // Use whatever is available on the system.
   else
   {
       e.EnumerateFacenames(wxFONTENCODING_SYSTEM, true);
       *result = e.foundFace;
   }
   return result;
}

