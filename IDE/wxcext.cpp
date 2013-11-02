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
    wxString* foundFace;
    firstFontEnumerator()
    {
        foundFace = NULL;
    }
    
    ~firstFontEnumerator()
    {
        if (this->foundFace)
        {
            delete this->foundFace;
        }
    }
    
    virtual bool OnFacename(const wxString& facename)
    {
        foundFace = new wxString(facename);
        return false;
    }
};

wxString* find_fixed_font_face()
{
   firstFontEnumerator* e = new firstFontEnumerator();
   wxString* result = new wxString();
   // First try the system default (if defined).
   if (e->IsValidFacename(wxString("monospace")))
   {
        *result = wxString("monospace");
        return result;
   }
   // Mac specifics
   if (e->IsValidFacename(wxString("Osaka")))
   {
        *result = wxString("Osaka");
        return result;
   }
   if (e->IsValidFacename(wxString("Monaco")))
   {
        *result = wxString("Monaco");
        return result;
   }
   // Use whatever is available on the system.
   e->EnumerateFacenames(wxFONTENCODING_SYSTEM, true);
   if (e->foundFace)
   {
       *result = *e->foundFace;
       delete e;
       return result;
   }
   else
   {
       return result;
   }
}

