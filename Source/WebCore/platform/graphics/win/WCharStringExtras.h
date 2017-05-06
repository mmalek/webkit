#pragma once

#include <wtf/text/WTFString.h>

inline wchar_t* stringToNullTerminatedWChar(const String& string)
{
    return reinterpret_cast<wchar_t*>(string.charactersWithNullTermination().data());
}

inline String wcharToString(const wchar_t* characters, unsigned length)
{
    return String(reinterpret_cast<const UChar*>(characters), length);
}
