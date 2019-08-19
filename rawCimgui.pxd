cdef extern from "cimgui/cimgui.h":
    ###Structs
    
    cdef struct ImColor:
        ImVec4 Value
        
    
    cdef struct ImDrawChannel:
        ImVector_ImDrawCmd _CmdBuffer
        ImVector_ImDrawIdx _IdxBuffer
        
    
    cdef struct ImDrawCmd:
        unsigned int ElemCount
        ImVec4 ClipRect
        ImTextureID TextureId
        unsigned int VtxOffset
        unsigned int IdxOffset
        ImDrawCallback UserCallback
        void* UserCallbackData
        
    
    cdef struct ImDrawData:
        bool Valid
        ImDrawList** CmdLists
        int CmdListsCount
        int TotalIdxCount
        int TotalVtxCount
        ImVec2 DisplayPos
        ImVec2 DisplaySize
        ImVec2 FramebufferScale
        
    
    cdef struct ImDrawList:
        ImVector_ImDrawCmd CmdBuffer
        ImVector_ImDrawIdx IdxBuffer
        ImVector_ImDrawVert VtxBuffer
        ImDrawListFlags Flags
        const ImDrawListSharedData* _Data
        const char* _OwnerName
        unsigned int _VtxCurrentOffset
        unsigned int _VtxCurrentIdx
        ImDrawVert* _VtxWritePtr
        ImDrawIdx* _IdxWritePtr
        ImVector_ImVec4 _ClipRectStack
        ImVector_ImTextureID _TextureIdStack
        ImVector_ImVec2 _Path
        ImDrawListSplitter _Splitter
        
    
    cdef struct ImDrawListSplitter:
        int _Current
        int _Count
        ImVector_ImDrawChannel _Channels
        
    
    cdef struct ImDrawVert:
        ImVec2 pos
        ImVec2 uv
        ImU32 col
        
    
    cdef struct ImFont:
        ImVector_float IndexAdvanceX
        float FallbackAdvanceX
        float FontSize
        ImVector_ImWchar IndexLookup
        ImVector_ImFontGlyph Glyphs
        const ImFontGlyph* FallbackGlyph
        ImVec2 DisplayOffset
        ImFontAtlas* ContainerAtlas
        const ImFontConfig* ConfigData
        short ConfigDataCount
        ImWchar FallbackChar
        float Scale
        float Ascent
        float Descent
        int MetricsTotalSurface
        bool DirtyLookupTables
        
    
    cdef struct ImFontAtlas:
        bool Locked
        ImFontAtlasFlags Flags
        ImTextureID TexID
        int TexDesiredWidth
        int TexGlyphPadding
        unsigned char* TexPixelsAlpha8
        unsigned int* TexPixelsRGBA32
        int TexWidth
        int TexHeight
        ImVec2 TexUvScale
        ImVec2 TexUvWhitePixel
        ImVector_ImFontPtr Fonts
        ImVector_ImFontAtlasCustomRect CustomRects
        ImVector_ImFontConfig ConfigData
        int CustomRectIds[1]
        
    
    cdef struct ImFontAtlasCustomRect:
        unsigned int ID
        unsigned short Width
        unsigned short Height
        unsigned short X
        unsigned short Y
        float GlyphAdvanceX
        ImVec2 GlyphOffset
        ImFont* Font
        
    
    cdef struct ImFontConfig:
        void* FontData
        int FontDataSize
        bool FontDataOwnedByAtlas
        int FontNo
        float SizePixels
        int OversampleH
        int OversampleV
        bool PixelSnapH
        ImVec2 GlyphExtraSpacing
        ImVec2 GlyphOffset
        const ImWchar* GlyphRanges
        float GlyphMinAdvanceX
        float GlyphMaxAdvanceX
        bool MergeMode
        unsigned int RasterizerFlags
        float RasterizerMultiply
        char Name[40]
        ImFont* DstFont
        
    
    cdef struct ImFontGlyph:
        ImWchar Codepoint
        float AdvanceX
        float X0
        float Y0
        float X1
        float Y1
        float U0
        float V0
        float U1
        float V1
        
    
    cdef struct ImFontGlyphRangesBuilder:
        ImVector_ImU32 UsedChars
        
    
    cdef struct ImGuiIO:
        ImGuiConfigFlags ConfigFlags
        ImGuiBackendFlags BackendFlags
        ImVec2 DisplaySize
        float DeltaTime
        float IniSavingRate
        const char* IniFilename
        const char* LogFilename
        float MouseDoubleClickTime
        float MouseDoubleClickMaxDist
        float MouseDragThreshold
        int KeyMap[ImGuiKey_COUNT]
        float KeyRepeatDelay
        float KeyRepeatRate
        void* UserData
        ImFontAtlas* Fonts
        float FontGlobalScale
        bool FontAllowUserScaling
        ImFont* FontDefault
        ImVec2 DisplayFramebufferScale
        bool MouseDrawCursor
        bool ConfigMacOSXBehaviors
        bool ConfigInputTextCursorBlink
        bool ConfigWindowsResizeFromEdges
        bool ConfigWindowsMoveFromTitleBarOnly
        const char* BackendPlatformName
        const char* BackendRendererName
        void* BackendPlatformUserData
        void* BackendRendererUserData
        void* BackendLanguageUserData

        # THIS ONE IS BROKE!!!
        const char** GetClipboardTextFn(void* user_data)

        void* SetClipboardTextFn(void* user_data,const char* text)
        # doesn't break
        void* ClipboardUserData
        # this would break
        # this will break too
        void* ImeSetInputScreenPosFn(int x,int y)
        void* ImeWindowHandle
        void* RenderDrawListsFnUnused
        ImVec2 MousePos
        bool MouseDown[5]
        float MouseWheel
        float MouseWheelH
        bool KeyCtrl
        bool KeyShift
        bool KeyAlt
        bool KeySuper
        bool KeysDown[512]
        float NavInputs[ImGuiNavInput_COUNT]
        bool WantCaptureMouse
        bool WantCaptureKeyboard
        bool WantTextInput
        bool WantSetMousePos
        bool WantSaveIniSettings
        bool NavActive
        bool NavVisible
        float Framerate
        int MetricsRenderVertices
        int MetricsRenderIndices
        int MetricsRenderWindows
        int MetricsActiveWindows
        int MetricsActiveAllocations
        ImVec2 MouseDelta
        ImVec2 MousePosPrev
        ImVec2 MouseClickedPos[5]
        double MouseClickedTime[5]
        bool MouseClicked[5]
        bool MouseDoubleClicked[5]
        bool MouseReleased[5]
        bool MouseDownOwned[5]
        bool MouseDownWasDoubleClick[5]
        float MouseDownDuration[5]
        float MouseDownDurationPrev[5]
        ImVec2 MouseDragMaxDistanceAbs[5]
        float MouseDragMaxDistanceSqr[5]
        float KeysDownDuration[512]
        float KeysDownDurationPrev[512]
        float NavInputsDownDuration[ImGuiNavInput_COUNT]
        float NavInputsDownDurationPrev[ImGuiNavInput_COUNT]
        ImVector_ImWchar InputQueueCharacters
        
    
    cdef struct ImGuiInputTextCallbackData:
        ImGuiInputTextFlags EventFlag
        ImGuiInputTextFlags Flags
        void* UserData
        ImWchar EventChar
        ImGuiKey EventKey
        char* Buf
        int BufTextLen
        int BufSize
        bool BufDirty
        int CursorPos
        int SelectionStart
        int SelectionEnd
        
    
    cdef struct ImGuiListClipper:
        float StartPosY
        float ItemsHeight
        int ItemsCount
        int StepNo
        int DisplayStart
        int DisplayEnd
        
    
    cdef struct ImGuiOnceUponAFrame:
        int RefFrame
        
    
    cdef struct ImGuiPayload:
        void* Data
        int DataSize
        ImGuiID SourceId
        ImGuiID SourceParentId
        int DataFrameCount
        char DataType[32+1]
        bool Preview
        bool Delivery
        
    
    cdef struct ImGuiSizeCallbackData:
        void* UserData
        ImVec2 Pos
        ImVec2 CurrentSize
        ImVec2 DesiredSize
        
    
    cdef struct ImGuiStorage:
        ImVector_ImGuiStoragePair Data
        
    
    cdef union anoonimous_struct_lolololol:
        int val_i
        float val_f
        void* val_p

    cdef struct ImGuiStoragePair:
        ImGuiID key
        anoonimous_struct_lolololol
        #union { int val_i; float val_f; void* val_p;} 
        
    
    cdef struct ImGuiStyle:
        float Alpha
        ImVec2 WindowPadding
        float WindowRounding
        float WindowBorderSize
        ImVec2 WindowMinSize
        ImVec2 WindowTitleAlign
        ImGuiDir WindowMenuButtonPosition
        float ChildRounding
        float ChildBorderSize
        float PopupRounding
        float PopupBorderSize
        ImVec2 FramePadding
        float FrameRounding
        float FrameBorderSize
        ImVec2 ItemSpacing
        ImVec2 ItemInnerSpacing
        ImVec2 TouchExtraPadding
        float IndentSpacing
        float ColumnsMinSpacing
        float ScrollbarSize
        float ScrollbarRounding
        float GrabMinSize
        float GrabRounding
        float TabRounding
        float TabBorderSize
        ImGuiDir ColorButtonPosition
        ImVec2 ButtonTextAlign
        ImVec2 SelectableTextAlign
        ImVec2 DisplayWindowPadding
        ImVec2 DisplaySafeAreaPadding
        float MouseCursorScale
        bool AntiAliasedLines
        bool AntiAliasedFill
        float CurveTessellationTol
        ImVec4 Colors[ImGuiCol_COUNT]
        
    
    cdef struct ImGuiTextBuffer:
        ImVector_char Buf
        
    
    cdef struct ImGuiTextFilter:
        char InputBuf[256]
        ImVector_ImGuiTextRange Filters
        int CountGrep
        
    
    cdef struct ImGuiTextRange:
        const char* b
        const char* e
        
    
    cdef struct ImVec2:
        float x
        float y
        
    
    cdef struct ImVec4:
        float x
        float y
        float z
        float w
        
    

    ###Enums
    
    cdef enum ImDrawCornerFlags_:
        ImDrawCornerFlags_None, # 0 -- 0
        ImDrawCornerFlags_TopLeft, # 1 -- 1 << 0
        ImDrawCornerFlags_TopRight, # 2 -- 1 << 1
        ImDrawCornerFlags_BotLeft, # 4 -- 1 << 2
        ImDrawCornerFlags_BotRight, # 8 -- 1 << 3
        ImDrawCornerFlags_Top, # 3 -- ImDrawCornerFlags_TopLeft | ImDrawCornerFlags_TopRight
        ImDrawCornerFlags_Bot, # 12 -- ImDrawCornerFlags_BotLeft | ImDrawCornerFlags_BotRight
        ImDrawCornerFlags_Left, # 5 -- ImDrawCornerFlags_TopLeft | ImDrawCornerFlags_BotLeft
        ImDrawCornerFlags_Right, # 10 -- ImDrawCornerFlags_TopRight | ImDrawCornerFlags_BotRight
        ImDrawCornerFlags_All, # 15 -- 0xF
        
    cdef enum ImDrawListFlags_:
        ImDrawListFlags_None, # 0 -- 0
        ImDrawListFlags_AntiAliasedLines, # 1 -- 1 << 0
        ImDrawListFlags_AntiAliasedFill, # 2 -- 1 << 1
        ImDrawListFlags_AllowVtxOffset, # 4 -- 1 << 2
        
    cdef enum ImFontAtlasFlags_:
        ImFontAtlasFlags_None, # 0 -- 0
        ImFontAtlasFlags_NoPowerOfTwoHeight, # 1 -- 1 << 0
        ImFontAtlasFlags_NoMouseCursors, # 2 -- 1 << 1
        
    cdef enum ImGuiBackendFlags_:
        ImGuiBackendFlags_None, # 0 -- 0
        ImGuiBackendFlags_HasGamepad, # 1 -- 1 << 0
        ImGuiBackendFlags_HasMouseCursors, # 2 -- 1 << 1
        ImGuiBackendFlags_HasSetMousePos, # 4 -- 1 << 2
        ImGuiBackendFlags_RendererHasVtxOffset, # 8 -- 1 << 3
        
    cdef enum ImGuiCol_:
        ImGuiCol_Text, # 0 -- 0
        ImGuiCol_TextDisabled, # 1 -- 1
        ImGuiCol_WindowBg, # 2 -- 2
        ImGuiCol_ChildBg, # 3 -- 3
        ImGuiCol_PopupBg, # 4 -- 4
        ImGuiCol_Border, # 5 -- 5
        ImGuiCol_BorderShadow, # 6 -- 6
        ImGuiCol_FrameBg, # 7 -- 7
        ImGuiCol_FrameBgHovered, # 8 -- 8
        ImGuiCol_FrameBgActive, # 9 -- 9
        ImGuiCol_TitleBg, # 10 -- 10
        ImGuiCol_TitleBgActive, # 11 -- 11
        ImGuiCol_TitleBgCollapsed, # 12 -- 12
        ImGuiCol_MenuBarBg, # 13 -- 13
        ImGuiCol_ScrollbarBg, # 14 -- 14
        ImGuiCol_ScrollbarGrab, # 15 -- 15
        ImGuiCol_ScrollbarGrabHovered, # 16 -- 16
        ImGuiCol_ScrollbarGrabActive, # 17 -- 17
        ImGuiCol_CheckMark, # 18 -- 18
        ImGuiCol_SliderGrab, # 19 -- 19
        ImGuiCol_SliderGrabActive, # 20 -- 20
        ImGuiCol_Button, # 21 -- 21
        ImGuiCol_ButtonHovered, # 22 -- 22
        ImGuiCol_ButtonActive, # 23 -- 23
        ImGuiCol_Header, # 24 -- 24
        ImGuiCol_HeaderHovered, # 25 -- 25
        ImGuiCol_HeaderActive, # 26 -- 26
        ImGuiCol_Separator, # 27 -- 27
        ImGuiCol_SeparatorHovered, # 28 -- 28
        ImGuiCol_SeparatorActive, # 29 -- 29
        ImGuiCol_ResizeGrip, # 30 -- 30
        ImGuiCol_ResizeGripHovered, # 31 -- 31
        ImGuiCol_ResizeGripActive, # 32 -- 32
        ImGuiCol_Tab, # 33 -- 33
        ImGuiCol_TabHovered, # 34 -- 34
        ImGuiCol_TabActive, # 35 -- 35
        ImGuiCol_TabUnfocused, # 36 -- 36
        ImGuiCol_TabUnfocusedActive, # 37 -- 37
        ImGuiCol_PlotLines, # 38 -- 38
        ImGuiCol_PlotLinesHovered, # 39 -- 39
        ImGuiCol_PlotHistogram, # 40 -- 40
        ImGuiCol_PlotHistogramHovered, # 41 -- 41
        ImGuiCol_TextSelectedBg, # 42 -- 42
        ImGuiCol_DragDropTarget, # 43 -- 43
        ImGuiCol_NavHighlight, # 44 -- 44
        ImGuiCol_NavWindowingHighlight, # 45 -- 45
        ImGuiCol_NavWindowingDimBg, # 46 -- 46
        ImGuiCol_ModalWindowDimBg, # 47 -- 47
        ImGuiCol_COUNT, # 48 -- 48
        
    cdef enum ImGuiColorEditFlags_:
        ImGuiColorEditFlags_None, # 0 -- 0
        ImGuiColorEditFlags_NoAlpha, # 2 -- 1 << 1
        ImGuiColorEditFlags_NoPicker, # 4 -- 1 << 2
        ImGuiColorEditFlags_NoOptions, # 8 -- 1 << 3
        ImGuiColorEditFlags_NoSmallPreview, # 16 -- 1 << 4
        ImGuiColorEditFlags_NoInputs, # 32 -- 1 << 5
        ImGuiColorEditFlags_NoTooltip, # 64 -- 1 << 6
        ImGuiColorEditFlags_NoLabel, # 128 -- 1 << 7
        ImGuiColorEditFlags_NoSidePreview, # 256 -- 1 << 8
        ImGuiColorEditFlags_NoDragDrop, # 512 -- 1 << 9
        ImGuiColorEditFlags_AlphaBar, # 65536 -- 1 << 16
        ImGuiColorEditFlags_AlphaPreview, # 131072 -- 1 << 17
        ImGuiColorEditFlags_AlphaPreviewHalf, # 262144 -- 1 << 18
        ImGuiColorEditFlags_HDR, # 524288 -- 1 << 19
        ImGuiColorEditFlags_DisplayRGB, # 1048576 -- 1 << 20
        ImGuiColorEditFlags_DisplayHSV, # 2097152 -- 1 << 21
        ImGuiColorEditFlags_DisplayHex, # 4194304 -- 1 << 22
        ImGuiColorEditFlags_Uint8, # 8388608 -- 1 << 23
        ImGuiColorEditFlags_Float, # 16777216 -- 1 << 24
        ImGuiColorEditFlags_PickerHueBar, # 33554432 -- 1 << 25
        ImGuiColorEditFlags_PickerHueWheel, # 67108864 -- 1 << 26
        ImGuiColorEditFlags_InputRGB, # 134217728 -- 1 << 27
        ImGuiColorEditFlags_InputHSV, # 268435456 -- 1 << 28
        ImGuiColorEditFlags__OptionsDefault, # 177209344 -- ImGuiColorEditFlags_Uint8|ImGuiColorEditFlags_DisplayRGB|ImGuiColorEditFlags_InputRGB|ImGuiColorEditFlags_PickerHueBar
        ImGuiColorEditFlags__DisplayMask, # 7340032 -- ImGuiColorEditFlags_DisplayRGB|ImGuiColorEditFlags_DisplayHSV|ImGuiColorEditFlags_DisplayHex
        ImGuiColorEditFlags__DataTypeMask, # 25165824 -- ImGuiColorEditFlags_Uint8|ImGuiColorEditFlags_Float
        ImGuiColorEditFlags__PickerMask, # 100663296 -- ImGuiColorEditFlags_PickerHueWheel|ImGuiColorEditFlags_PickerHueBar
        ImGuiColorEditFlags__InputMask, # 402653184 -- ImGuiColorEditFlags_InputRGB|ImGuiColorEditFlags_InputHSV
        
    cdef enum ImGuiComboFlags_:
        ImGuiComboFlags_None, # 0 -- 0
        ImGuiComboFlags_PopupAlignLeft, # 1 -- 1 << 0
        ImGuiComboFlags_HeightSmall, # 2 -- 1 << 1
        ImGuiComboFlags_HeightRegular, # 4 -- 1 << 2
        ImGuiComboFlags_HeightLarge, # 8 -- 1 << 3
        ImGuiComboFlags_HeightLargest, # 16 -- 1 << 4
        ImGuiComboFlags_NoArrowButton, # 32 -- 1 << 5
        ImGuiComboFlags_NoPreview, # 64 -- 1 << 6
        ImGuiComboFlags_HeightMask_, # 30 -- ImGuiComboFlags_HeightSmall | ImGuiComboFlags_HeightRegular | ImGuiComboFlags_HeightLarge | ImGuiComboFlags_HeightLargest
        
    cdef enum ImGuiCond_:
        ImGuiCond_Always, # 1 -- 1 << 0
        ImGuiCond_Once, # 2 -- 1 << 1
        ImGuiCond_FirstUseEver, # 4 -- 1 << 2
        ImGuiCond_Appearing, # 8 -- 1 << 3
        
    cdef enum ImGuiConfigFlags_:
        ImGuiConfigFlags_None, # 0 -- 0
        ImGuiConfigFlags_NavEnableKeyboard, # 1 -- 1 << 0
        ImGuiConfigFlags_NavEnableGamepad, # 2 -- 1 << 1
        ImGuiConfigFlags_NavEnableSetMousePos, # 4 -- 1 << 2
        ImGuiConfigFlags_NavNoCaptureKeyboard, # 8 -- 1 << 3
        ImGuiConfigFlags_NoMouse, # 16 -- 1 << 4
        ImGuiConfigFlags_NoMouseCursorChange, # 32 -- 1 << 5
        ImGuiConfigFlags_IsSRGB, # 1048576 -- 1 << 20
        ImGuiConfigFlags_IsTouchScreen, # 2097152 -- 1 << 21
        
    cdef enum ImGuiDataType_:
        ImGuiDataType_S8, # 0 -- 0
        ImGuiDataType_U8, # 1 -- 1
        ImGuiDataType_S16, # 2 -- 2
        ImGuiDataType_U16, # 3 -- 3
        ImGuiDataType_S32, # 4 -- 4
        ImGuiDataType_U32, # 5 -- 5
        ImGuiDataType_S64, # 6 -- 6
        ImGuiDataType_U64, # 7 -- 7
        ImGuiDataType_Float, # 8 -- 8
        ImGuiDataType_Double, # 9 -- 9
        ImGuiDataType_COUNT, # 10 -- 10
        
    cdef enum ImGuiDir_:
        ImGuiDir_None, # -1 -- -1
        ImGuiDir_Left, # 0 -- 0
        ImGuiDir_Right, # 1 -- 1
        ImGuiDir_Up, # 2 -- 2
        ImGuiDir_Down, # 3 -- 3
        ImGuiDir_COUNT, # 4 -- 4
        
    cdef enum ImGuiDragDropFlags_:
        ImGuiDragDropFlags_None, # 0 -- 0
        ImGuiDragDropFlags_SourceNoPreviewTooltip, # 1 -- 1 << 0
        ImGuiDragDropFlags_SourceNoDisableHover, # 2 -- 1 << 1
        ImGuiDragDropFlags_SourceNoHoldToOpenOthers, # 4 -- 1 << 2
        ImGuiDragDropFlags_SourceAllowNullID, # 8 -- 1 << 3
        ImGuiDragDropFlags_SourceExtern, # 16 -- 1 << 4
        ImGuiDragDropFlags_SourceAutoExpirePayload, # 32 -- 1 << 5
        ImGuiDragDropFlags_AcceptBeforeDelivery, # 1024 -- 1 << 10
        ImGuiDragDropFlags_AcceptNoDrawDefaultRect, # 2048 -- 1 << 11
        ImGuiDragDropFlags_AcceptNoPreviewTooltip, # 4096 -- 1 << 12
        ImGuiDragDropFlags_AcceptPeekOnly, # 3072 -- ImGuiDragDropFlags_AcceptBeforeDelivery | ImGuiDragDropFlags_AcceptNoDrawDefaultRect
        
    cdef enum ImGuiFocusedFlags_:
        ImGuiFocusedFlags_None, # 0 -- 0
        ImGuiFocusedFlags_ChildWindows, # 1 -- 1 << 0
        ImGuiFocusedFlags_RootWindow, # 2 -- 1 << 1
        ImGuiFocusedFlags_AnyWindow, # 4 -- 1 << 2
        ImGuiFocusedFlags_RootAndChildWindows, # 3 -- ImGuiFocusedFlags_RootWindow | ImGuiFocusedFlags_ChildWindows
        
    cdef enum ImGuiHoveredFlags_:
        ImGuiHoveredFlags_None, # 0 -- 0
        ImGuiHoveredFlags_ChildWindows, # 1 -- 1 << 0
        ImGuiHoveredFlags_RootWindow, # 2 -- 1 << 1
        ImGuiHoveredFlags_AnyWindow, # 4 -- 1 << 2
        ImGuiHoveredFlags_AllowWhenBlockedByPopup, # 8 -- 1 << 3
        ImGuiHoveredFlags_AllowWhenBlockedByActiveItem, # 32 -- 1 << 5
        ImGuiHoveredFlags_AllowWhenOverlapped, # 64 -- 1 << 6
        ImGuiHoveredFlags_AllowWhenDisabled, # 128 -- 1 << 7
        ImGuiHoveredFlags_RectOnly, # 104 -- ImGuiHoveredFlags_AllowWhenBlockedByPopup | ImGuiHoveredFlags_AllowWhenBlockedByActiveItem | ImGuiHoveredFlags_AllowWhenOverlapped
        ImGuiHoveredFlags_RootAndChildWindows, # 3 -- ImGuiHoveredFlags_RootWindow | ImGuiHoveredFlags_ChildWindows
        
    cdef enum ImGuiInputTextFlags_:
        ImGuiInputTextFlags_None, # 0 -- 0
        ImGuiInputTextFlags_CharsDecimal, # 1 -- 1 << 0
        ImGuiInputTextFlags_CharsHexadecimal, # 2 -- 1 << 1
        ImGuiInputTextFlags_CharsUppercase, # 4 -- 1 << 2
        ImGuiInputTextFlags_CharsNoBlank, # 8 -- 1 << 3
        ImGuiInputTextFlags_AutoSelectAll, # 16 -- 1 << 4
        ImGuiInputTextFlags_EnterReturnsTrue, # 32 -- 1 << 5
        ImGuiInputTextFlags_CallbackCompletion, # 64 -- 1 << 6
        ImGuiInputTextFlags_CallbackHistory, # 128 -- 1 << 7
        ImGuiInputTextFlags_CallbackAlways, # 256 -- 1 << 8
        ImGuiInputTextFlags_CallbackCharFilter, # 512 -- 1 << 9
        ImGuiInputTextFlags_AllowTabInput, # 1024 -- 1 << 10
        ImGuiInputTextFlags_CtrlEnterForNewLine, # 2048 -- 1 << 11
        ImGuiInputTextFlags_NoHorizontalScroll, # 4096 -- 1 << 12
        ImGuiInputTextFlags_AlwaysInsertMode, # 8192 -- 1 << 13
        ImGuiInputTextFlags_ReadOnly, # 16384 -- 1 << 14
        ImGuiInputTextFlags_Password, # 32768 -- 1 << 15
        ImGuiInputTextFlags_NoUndoRedo, # 65536 -- 1 << 16
        ImGuiInputTextFlags_CharsScientific, # 131072 -- 1 << 17
        ImGuiInputTextFlags_CallbackResize, # 262144 -- 1 << 18
        ImGuiInputTextFlags_Multiline, # 1048576 -- 1 << 20
        ImGuiInputTextFlags_NoMarkEdited, # 2097152 -- 1 << 21
        
    cdef enum ImGuiKey_:
        ImGuiKey_Tab, # 0 -- 0
        ImGuiKey_LeftArrow, # 1 -- 1
        ImGuiKey_RightArrow, # 2 -- 2
        ImGuiKey_UpArrow, # 3 -- 3
        ImGuiKey_DownArrow, # 4 -- 4
        ImGuiKey_PageUp, # 5 -- 5
        ImGuiKey_PageDown, # 6 -- 6
        ImGuiKey_Home, # 7 -- 7
        ImGuiKey_End, # 8 -- 8
        ImGuiKey_Insert, # 9 -- 9
        ImGuiKey_Delete, # 10 -- 10
        ImGuiKey_Backspace, # 11 -- 11
        ImGuiKey_Space, # 12 -- 12
        ImGuiKey_Enter, # 13 -- 13
        ImGuiKey_Escape, # 14 -- 14
        ImGuiKey_KeyPadEnter, # 15 -- 15
        ImGuiKey_A, # 16 -- 16
        ImGuiKey_C, # 17 -- 17
        ImGuiKey_V, # 18 -- 18
        ImGuiKey_X, # 19 -- 19
        ImGuiKey_Y, # 20 -- 20
        ImGuiKey_Z, # 21 -- 21
        ImGuiKey_COUNT, # 22 -- 22
        
    cdef enum ImGuiMouseCursor_:
        ImGuiMouseCursor_None, # -1 -- -1
        ImGuiMouseCursor_Arrow, # 0 -- 0
        ImGuiMouseCursor_TextInput, # 1 -- 1
        ImGuiMouseCursor_ResizeAll, # 2 -- 2
        ImGuiMouseCursor_ResizeNS, # 3 -- 3
        ImGuiMouseCursor_ResizeEW, # 4 -- 4
        ImGuiMouseCursor_ResizeNESW, # 5 -- 5
        ImGuiMouseCursor_ResizeNWSE, # 6 -- 6
        ImGuiMouseCursor_Hand, # 7 -- 7
        ImGuiMouseCursor_COUNT, # 8 -- 8
        
    cdef enum ImGuiNavInput_:
        ImGuiNavInput_Activate, # 0 -- 0
        ImGuiNavInput_Cancel, # 1 -- 1
        ImGuiNavInput_Input, # 2 -- 2
        ImGuiNavInput_Menu, # 3 -- 3
        ImGuiNavInput_DpadLeft, # 4 -- 4
        ImGuiNavInput_DpadRight, # 5 -- 5
        ImGuiNavInput_DpadUp, # 6 -- 6
        ImGuiNavInput_DpadDown, # 7 -- 7
        ImGuiNavInput_LStickLeft, # 8 -- 8
        ImGuiNavInput_LStickRight, # 9 -- 9
        ImGuiNavInput_LStickUp, # 10 -- 10
        ImGuiNavInput_LStickDown, # 11 -- 11
        ImGuiNavInput_FocusPrev, # 12 -- 12
        ImGuiNavInput_FocusNext, # 13 -- 13
        ImGuiNavInput_TweakSlow, # 14 -- 14
        ImGuiNavInput_TweakFast, # 15 -- 15
        ImGuiNavInput_KeyMenu_, # 16 -- 16
        ImGuiNavInput_KeyTab_, # 17 -- 17
        ImGuiNavInput_KeyLeft_, # 18 -- 18
        ImGuiNavInput_KeyRight_, # 19 -- 19
        ImGuiNavInput_KeyUp_, # 20 -- 20
        ImGuiNavInput_KeyDown_, # 21 -- 21
        ImGuiNavInput_COUNT, # 22 -- 22
        ImGuiNavInput_InternalStart_, # 16 -- ImGuiNavInput_KeyMenu_
        
    cdef enum ImGuiSelectableFlags_:
        ImGuiSelectableFlags_None, # 0 -- 0
        ImGuiSelectableFlags_DontClosePopups, # 1 -- 1 << 0
        ImGuiSelectableFlags_SpanAllColumns, # 2 -- 1 << 1
        ImGuiSelectableFlags_AllowDoubleClick, # 4 -- 1 << 2
        ImGuiSelectableFlags_Disabled, # 8 -- 1 << 3
        
    cdef enum ImGuiStyleVar_:
        ImGuiStyleVar_Alpha, # 0 -- 0
        ImGuiStyleVar_WindowPadding, # 1 -- 1
        ImGuiStyleVar_WindowRounding, # 2 -- 2
        ImGuiStyleVar_WindowBorderSize, # 3 -- 3
        ImGuiStyleVar_WindowMinSize, # 4 -- 4
        ImGuiStyleVar_WindowTitleAlign, # 5 -- 5
        ImGuiStyleVar_ChildRounding, # 6 -- 6
        ImGuiStyleVar_ChildBorderSize, # 7 -- 7
        ImGuiStyleVar_PopupRounding, # 8 -- 8
        ImGuiStyleVar_PopupBorderSize, # 9 -- 9
        ImGuiStyleVar_FramePadding, # 10 -- 10
        ImGuiStyleVar_FrameRounding, # 11 -- 11
        ImGuiStyleVar_FrameBorderSize, # 12 -- 12
        ImGuiStyleVar_ItemSpacing, # 13 -- 13
        ImGuiStyleVar_ItemInnerSpacing, # 14 -- 14
        ImGuiStyleVar_IndentSpacing, # 15 -- 15
        ImGuiStyleVar_ScrollbarSize, # 16 -- 16
        ImGuiStyleVar_ScrollbarRounding, # 17 -- 17
        ImGuiStyleVar_GrabMinSize, # 18 -- 18
        ImGuiStyleVar_GrabRounding, # 19 -- 19
        ImGuiStyleVar_TabRounding, # 20 -- 20
        ImGuiStyleVar_ButtonTextAlign, # 21 -- 21
        ImGuiStyleVar_SelectableTextAlign, # 22 -- 22
        ImGuiStyleVar_COUNT, # 23 -- 23
        
    cdef enum ImGuiTabBarFlags_:
        ImGuiTabBarFlags_None, # 0 -- 0
        ImGuiTabBarFlags_Reorderable, # 1 -- 1 << 0
        ImGuiTabBarFlags_AutoSelectNewTabs, # 2 -- 1 << 1
        ImGuiTabBarFlags_TabListPopupButton, # 4 -- 1 << 2
        ImGuiTabBarFlags_NoCloseWithMiddleMouseButton, # 8 -- 1 << 3
        ImGuiTabBarFlags_NoTabListScrollingButtons, # 16 -- 1 << 4
        ImGuiTabBarFlags_NoTooltip, # 32 -- 1 << 5
        ImGuiTabBarFlags_FittingPolicyResizeDown, # 64 -- 1 << 6
        ImGuiTabBarFlags_FittingPolicyScroll, # 128 -- 1 << 7
        ImGuiTabBarFlags_FittingPolicyMask_, # 192 -- ImGuiTabBarFlags_FittingPolicyResizeDown | ImGuiTabBarFlags_FittingPolicyScroll
        ImGuiTabBarFlags_FittingPolicyDefault_, # 64 -- ImGuiTabBarFlags_FittingPolicyResizeDown
        
    cdef enum ImGuiTabItemFlags_:
        ImGuiTabItemFlags_None, # 0 -- 0
        ImGuiTabItemFlags_UnsavedDocument, # 1 -- 1 << 0
        ImGuiTabItemFlags_SetSelected, # 2 -- 1 << 1
        ImGuiTabItemFlags_NoCloseWithMiddleMouseButton, # 4 -- 1 << 2
        ImGuiTabItemFlags_NoPushId, # 8 -- 1 << 3
        
    cdef enum ImGuiTreeNodeFlags_:
        ImGuiTreeNodeFlags_None, # 0 -- 0
        ImGuiTreeNodeFlags_Selected, # 1 -- 1 << 0
        ImGuiTreeNodeFlags_Framed, # 2 -- 1 << 1
        ImGuiTreeNodeFlags_AllowItemOverlap, # 4 -- 1 << 2
        ImGuiTreeNodeFlags_NoTreePushOnOpen, # 8 -- 1 << 3
        ImGuiTreeNodeFlags_NoAutoOpenOnLog, # 16 -- 1 << 4
        ImGuiTreeNodeFlags_DefaultOpen, # 32 -- 1 << 5
        ImGuiTreeNodeFlags_OpenOnDoubleClick, # 64 -- 1 << 6
        ImGuiTreeNodeFlags_OpenOnArrow, # 128 -- 1 << 7
        ImGuiTreeNodeFlags_Leaf, # 256 -- 1 << 8
        ImGuiTreeNodeFlags_Bullet, # 512 -- 1 << 9
        ImGuiTreeNodeFlags_FramePadding, # 1024 -- 1 << 10
        ImGuiTreeNodeFlags_NavLeftJumpsBackHere, # 8192 -- 1 << 13
        ImGuiTreeNodeFlags_CollapsingHeader, # 26 -- ImGuiTreeNodeFlags_Framed | ImGuiTreeNodeFlags_NoTreePushOnOpen | ImGuiTreeNodeFlags_NoAutoOpenOnLog
        
    cdef enum ImGuiWindowFlags_:
        ImGuiWindowFlags_None, # 0 -- 0
        ImGuiWindowFlags_NoTitleBar, # 1 -- 1 << 0
        ImGuiWindowFlags_NoResize, # 2 -- 1 << 1
        ImGuiWindowFlags_NoMove, # 4 -- 1 << 2
        ImGuiWindowFlags_NoScrollbar, # 8 -- 1 << 3
        ImGuiWindowFlags_NoScrollWithMouse, # 16 -- 1 << 4
        ImGuiWindowFlags_NoCollapse, # 32 -- 1 << 5
        ImGuiWindowFlags_AlwaysAutoResize, # 64 -- 1 << 6
        ImGuiWindowFlags_NoBackground, # 128 -- 1 << 7
        ImGuiWindowFlags_NoSavedSettings, # 256 -- 1 << 8
        ImGuiWindowFlags_NoMouseInputs, # 512 -- 1 << 9
        ImGuiWindowFlags_MenuBar, # 1024 -- 1 << 10
        ImGuiWindowFlags_HorizontalScrollbar, # 2048 -- 1 << 11
        ImGuiWindowFlags_NoFocusOnAppearing, # 4096 -- 1 << 12
        ImGuiWindowFlags_NoBringToFrontOnFocus, # 8192 -- 1 << 13
        ImGuiWindowFlags_AlwaysVerticalScrollbar, # 16384 -- 1 << 14
        ImGuiWindowFlags_AlwaysHorizontalScrollbar, # 32768 -- 1<< 15
        ImGuiWindowFlags_AlwaysUseWindowPadding, # 65536 -- 1 << 16
        ImGuiWindowFlags_NoNavInputs, # 262144 -- 1 << 18
        ImGuiWindowFlags_NoNavFocus, # 524288 -- 1 << 19
        ImGuiWindowFlags_UnsavedDocument, # 1048576 -- 1 << 20
        ImGuiWindowFlags_NoNav, # 786432 -- ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus
        ImGuiWindowFlags_NoDecoration, # 43 -- ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoCollapse
        ImGuiWindowFlags_NoInputs, # 786944 -- ImGuiWindowFlags_NoMouseInputs | ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus
        ImGuiWindowFlags_NavFlattened, # 8388608 -- 1 << 23
        ImGuiWindowFlags_ChildWindow, # 16777216 -- 1 << 24
        ImGuiWindowFlags_Tooltip, # 33554432 -- 1 << 25
        ImGuiWindowFlags_Popup, # 67108864 -- 1 << 26
        ImGuiWindowFlags_Modal, # 134217728 -- 1 << 27
        ImGuiWindowFlags_ChildMenu, # 268435456 -- 1 << 28
        


    ### From definitions.json
    
    #Autogenerated for ImColor_HSV
    cpdef ImColor HSV(ImColor* self,float h,float s,float v,float a)
    cpdef void HSV(ImColor *pOut,ImColor* self,float h,float s,float v,float a)
    cpdef ImColor_Simple HSV(ImColor* self,float h,float s,float v,float a)
    pass
    
    #Autogenerated for ImColor_ImColor
    cpdef  ImColor()
    cpdef  ImColor(int r,int g,int b,int a)
    cpdef  ImColor(ImU32 rgba)
    cpdef  ImColor(float r,float g,float b,float a)
    cpdef  ImColor(const ImVec4 col)
    pass
    
    #Autogenerated for ImColor_SetHSV
    cpdef void SetHSV(ImColor* self,float h,float s,float v,float a)
    pass
    
    #Autogenerated for ImColor_destroy
    
    #{'args': '(ImColor* self)', 'argsT': [{'name': 'self', 'type': 'ImColor*'}], 'call_args': '(self)', 'cimguiname': 'ImColor_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImColor_destroy', 'ret': 'void', 'signature': '(ImColor*)', 'stname': 'ImColor'}
    pass
    
    #Autogenerated for ImDrawCmd_ImDrawCmd
    cpdef  ImDrawCmd()
    pass
    
    #Autogenerated for ImDrawCmd_destroy
    
    #{'args': '(ImDrawCmd* self)', 'argsT': [{'name': 'self', 'type': 'ImDrawCmd*'}], 'call_args': '(self)', 'cimguiname': 'ImDrawCmd_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImDrawCmd_destroy', 'ret': 'void', 'signature': '(ImDrawCmd*)', 'stname': 'ImDrawCmd'}
    pass
    
    #Autogenerated for ImDrawData_Clear
    cpdef void Clear(ImDrawData* self)
    pass
    
    #Autogenerated for ImDrawData_DeIndexAllBuffers
    cpdef void DeIndexAllBuffers(ImDrawData* self)
    pass
    
    #Autogenerated for ImDrawData_ImDrawData
    cpdef  ImDrawData()
    pass
    
    #Autogenerated for ImDrawData_ScaleClipRects
    cpdef void ScaleClipRects(ImDrawData* self,const ImVec2 fb_scale)
    pass
    
    #Autogenerated for ImDrawData_destroy
    
    #{'args': '(ImDrawData* self)', 'argsT': [{'name': 'self', 'type': 'ImDrawData*'}], 'call_args': '(self)', 'cimguiname': 'ImDrawData_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImDrawData_destroy', 'ret': 'void', 'signature': '(ImDrawData*)', 'stname': 'ImDrawData'}
    pass
    
    #Autogenerated for ImDrawListSplitter_Clear
    cpdef void Clear(ImDrawListSplitter* self)
    pass
    
    #Autogenerated for ImDrawListSplitter_ClearFreeMemory
    cpdef void ClearFreeMemory(ImDrawListSplitter* self)
    pass
    
    #Autogenerated for ImDrawListSplitter_ImDrawListSplitter
    cpdef  ImDrawListSplitter()
    pass
    
    #Autogenerated for ImDrawListSplitter_Merge
    cpdef void Merge(ImDrawListSplitter* self,ImDrawList* draw_list)
    pass
    
    #Autogenerated for ImDrawListSplitter_SetCurrentChannel
    cpdef void SetCurrentChannel(ImDrawListSplitter* self,ImDrawList* draw_list,int channel_idx)
    pass
    
    #Autogenerated for ImDrawListSplitter_Split
    cpdef void Split(ImDrawListSplitter* self,ImDrawList* draw_list,int count)
    pass
    
    #Autogenerated for ImDrawListSplitter_destroy
    
    #{'args': '(ImDrawListSplitter* self)', 'argsT': [{'name': 'self', 'type': 'ImDrawListSplitter*'}], 'call_args': '(self)', 'cimguiname': 'ImDrawListSplitter_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImDrawListSplitter_destroy', 'ret': 'void', 'signature': '(ImDrawListSplitter*)', 'stname': 'ImDrawListSplitter'}
    pass
    
    #Autogenerated for ImDrawList_AddBezierCurve
    cpdef void AddBezierCurve(ImDrawList* self,const ImVec2 pos0,const ImVec2 cp0,const ImVec2 cp1,const ImVec2 pos1,ImU32 col,float thickness,int num_segments)
    pass
    
    #Autogenerated for ImDrawList_AddCallback
    cpdef void AddCallback(ImDrawList* self,ImDrawCallback callback,void* callback_data)
    pass
    
    #Autogenerated for ImDrawList_AddCircle
    cpdef void AddCircle(ImDrawList* self,const ImVec2 centre,float radius,ImU32 col,int num_segments,float thickness)
    pass
    
    #Autogenerated for ImDrawList_AddCircleFilled
    cpdef void AddCircleFilled(ImDrawList* self,const ImVec2 centre,float radius,ImU32 col,int num_segments)
    pass
    
    #Autogenerated for ImDrawList_AddConvexPolyFilled
    cpdef void AddConvexPolyFilled(ImDrawList* self,const ImVec2* points,int num_points,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_AddDrawCmd
    cpdef void AddDrawCmd(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_AddImage
    cpdef void AddImage(ImDrawList* self,ImTextureID user_texture_id,const ImVec2 a,const ImVec2 b,const ImVec2 uv_a,const ImVec2 uv_b,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_AddImageQuad
    cpdef void AddImageQuad(ImDrawList* self,ImTextureID user_texture_id,const ImVec2 a,const ImVec2 b,const ImVec2 c,const ImVec2 d,const ImVec2 uv_a,const ImVec2 uv_b,const ImVec2 uv_c,const ImVec2 uv_d,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_AddImageRounded
    cpdef void AddImageRounded(ImDrawList* self,ImTextureID user_texture_id,const ImVec2 a,const ImVec2 b,const ImVec2 uv_a,const ImVec2 uv_b,ImU32 col,float rounding,ImDrawCornerFlags rounding_corners)
    pass
    
    #Autogenerated for ImDrawList_AddLine
    cpdef void AddLine(ImDrawList* self,const ImVec2 a,const ImVec2 b,ImU32 col,float thickness)
    pass
    
    #Autogenerated for ImDrawList_AddPolyline
    cpdef void AddPolyline(ImDrawList* self,const ImVec2* points,int num_points,ImU32 col,bool closed,float thickness)
    pass
    
    #Autogenerated for ImDrawList_AddQuad
    cpdef void AddQuad(ImDrawList* self,const ImVec2 a,const ImVec2 b,const ImVec2 c,const ImVec2 d,ImU32 col,float thickness)
    pass
    
    #Autogenerated for ImDrawList_AddQuadFilled
    cpdef void AddQuadFilled(ImDrawList* self,const ImVec2 a,const ImVec2 b,const ImVec2 c,const ImVec2 d,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_AddRect
    cpdef void AddRect(ImDrawList* self,const ImVec2 a,const ImVec2 b,ImU32 col,float rounding,ImDrawCornerFlags rounding_corners,float thickness)
    pass
    
    #Autogenerated for ImDrawList_AddRectFilled
    cpdef void AddRectFilled(ImDrawList* self,const ImVec2 a,const ImVec2 b,ImU32 col,float rounding,ImDrawCornerFlags rounding_corners)
    pass
    
    #Autogenerated for ImDrawList_AddRectFilledMultiColor
    cpdef void AddRectFilledMultiColor(ImDrawList* self,const ImVec2 a,const ImVec2 b,ImU32 col_upr_left,ImU32 col_upr_right,ImU32 col_bot_right,ImU32 col_bot_left)
    pass
    
    #Autogenerated for ImDrawList_AddText
    cpdef void AddText(ImDrawList* self,const ImVec2 pos,ImU32 col,const char* text_begin,const char* text_end)
    cpdef void AddText(ImDrawList* self,const ImFont* font,float font_size,const ImVec2 pos,ImU32 col,const char* text_begin,const char* text_end,float wrap_width,const ImVec4* cpu_fine_clip_rect)
    pass
    
    #Autogenerated for ImDrawList_AddTriangle
    cpdef void AddTriangle(ImDrawList* self,const ImVec2 a,const ImVec2 b,const ImVec2 c,ImU32 col,float thickness)
    pass
    
    #Autogenerated for ImDrawList_AddTriangleFilled
    cpdef void AddTriangleFilled(ImDrawList* self,const ImVec2 a,const ImVec2 b,const ImVec2 c,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_ChannelsMerge
    cpdef void ChannelsMerge(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_ChannelsSetCurrent
    cpdef void ChannelsSetCurrent(ImDrawList* self,int n)
    pass
    
    #Autogenerated for ImDrawList_ChannelsSplit
    cpdef void ChannelsSplit(ImDrawList* self,int count)
    pass
    
    #Autogenerated for ImDrawList_Clear
    cpdef void Clear(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_ClearFreeMemory
    cpdef void ClearFreeMemory(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_CloneOutput
    cpdef ImDrawList* CloneOutput(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_GetClipRectMax
    cpdef ImVec2 GetClipRectMax(ImDrawList* self)
    cpdef void GetClipRectMax(ImVec2 *pOut,ImDrawList* self)
    cpdef ImVec2_Simple GetClipRectMax(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_GetClipRectMin
    cpdef ImVec2 GetClipRectMin(ImDrawList* self)
    cpdef void GetClipRectMin(ImVec2 *pOut,ImDrawList* self)
    cpdef ImVec2_Simple GetClipRectMin(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_ImDrawList
    cpdef  ImDrawList(const ImDrawListSharedData* shared_data)
    pass
    
    #Autogenerated for ImDrawList_PathArcTo
    cpdef void PathArcTo(ImDrawList* self,const ImVec2 centre,float radius,float a_min,float a_max,int num_segments)
    pass
    
    #Autogenerated for ImDrawList_PathArcToFast
    cpdef void PathArcToFast(ImDrawList* self,const ImVec2 centre,float radius,int a_min_of_12,int a_max_of_12)
    pass
    
    #Autogenerated for ImDrawList_PathBezierCurveTo
    cpdef void PathBezierCurveTo(ImDrawList* self,const ImVec2 p1,const ImVec2 p2,const ImVec2 p3,int num_segments)
    pass
    
    #Autogenerated for ImDrawList_PathClear
    cpdef void PathClear(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_PathFillConvex
    cpdef void PathFillConvex(ImDrawList* self,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_PathLineTo
    cpdef void PathLineTo(ImDrawList* self,const ImVec2 pos)
    pass
    
    #Autogenerated for ImDrawList_PathLineToMergeDuplicate
    cpdef void PathLineToMergeDuplicate(ImDrawList* self,const ImVec2 pos)
    pass
    
    #Autogenerated for ImDrawList_PathRect
    cpdef void PathRect(ImDrawList* self,const ImVec2 rect_min,const ImVec2 rect_max,float rounding,ImDrawCornerFlags rounding_corners)
    pass
    
    #Autogenerated for ImDrawList_PathStroke
    cpdef void PathStroke(ImDrawList* self,ImU32 col,bool closed,float thickness)
    pass
    
    #Autogenerated for ImDrawList_PopClipRect
    cpdef void PopClipRect(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_PopTextureID
    cpdef void PopTextureID(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_PrimQuadUV
    cpdef void PrimQuadUV(ImDrawList* self,const ImVec2 a,const ImVec2 b,const ImVec2 c,const ImVec2 d,const ImVec2 uv_a,const ImVec2 uv_b,const ImVec2 uv_c,const ImVec2 uv_d,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_PrimRect
    cpdef void PrimRect(ImDrawList* self,const ImVec2 a,const ImVec2 b,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_PrimRectUV
    cpdef void PrimRectUV(ImDrawList* self,const ImVec2 a,const ImVec2 b,const ImVec2 uv_a,const ImVec2 uv_b,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_PrimReserve
    cpdef void PrimReserve(ImDrawList* self,int idx_count,int vtx_count)
    pass
    
    #Autogenerated for ImDrawList_PrimVtx
    cpdef void PrimVtx(ImDrawList* self,const ImVec2 pos,const ImVec2 uv,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_PrimWriteIdx
    cpdef void PrimWriteIdx(ImDrawList* self,ImDrawIdx idx)
    pass
    
    #Autogenerated for ImDrawList_PrimWriteVtx
    cpdef void PrimWriteVtx(ImDrawList* self,const ImVec2 pos,const ImVec2 uv,ImU32 col)
    pass
    
    #Autogenerated for ImDrawList_PushClipRect
    cpdef void PushClipRect(ImDrawList* self,ImVec2 clip_rect_min,ImVec2 clip_rect_max,bool intersect_with_current_clip_rect)
    pass
    
    #Autogenerated for ImDrawList_PushClipRectFullScreen
    cpdef void PushClipRectFullScreen(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_PushTextureID
    cpdef void PushTextureID(ImDrawList* self,ImTextureID texture_id)
    pass
    
    #Autogenerated for ImDrawList_UpdateClipRect
    cpdef void UpdateClipRect(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_UpdateTextureID
    cpdef void UpdateTextureID(ImDrawList* self)
    pass
    
    #Autogenerated for ImDrawList_destroy
    
    #{'args': '(ImDrawList* self)', 'argsT': [{'name': 'self', 'type': 'ImDrawList*'}], 'call_args': '(self)', 'cimguiname': 'ImDrawList_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImDrawList_destroy', 'ret': 'void', 'signature': '(ImDrawList*)', 'stname': 'ImDrawList'}
    pass
    
    #Autogenerated for ImFontAtlasCustomRect_ImFontAtlasCustomRect
    cpdef  ImFontAtlasCustomRect()
    pass
    
    #Autogenerated for ImFontAtlasCustomRect_IsPacked
    cpdef bool IsPacked(ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImFontAtlasCustomRect_destroy
    
    #{'args': '(ImFontAtlasCustomRect* self)', 'argsT': [{'name': 'self', 'type': 'ImFontAtlasCustomRect*'}], 'call_args': '(self)', 'cimguiname': 'ImFontAtlasCustomRect_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImFontAtlasCustomRect_destroy', 'ret': 'void', 'signature': '(ImFontAtlasCustomRect*)', 'stname': 'ImFontAtlasCustomRect'}
    pass
    
    #Autogenerated for ImFontAtlas_AddCustomRectFontGlyph
    cpdef int AddCustomRectFontGlyph(ImFontAtlas* self,ImFont* font,ImWchar id,int width,int height,float advance_x,const ImVec2 offset)
    pass
    
    #Autogenerated for ImFontAtlas_AddCustomRectRegular
    cpdef int AddCustomRectRegular(ImFontAtlas* self,unsigned int id,int width,int height)
    pass
    
    #Autogenerated for ImFontAtlas_AddFont
    cpdef ImFont* AddFont(ImFontAtlas* self,const ImFontConfig* font_cfg)
    pass
    
    #Autogenerated for ImFontAtlas_AddFontDefault
    cpdef ImFont* AddFontDefault(ImFontAtlas* self,const ImFontConfig* font_cfg)
    pass
    
    #Autogenerated for ImFontAtlas_AddFontFromFileTTF
    cpdef ImFont* AddFontFromFileTTF(ImFontAtlas* self,const char* filename,float size_pixels,const ImFontConfig* font_cfg,const ImWchar* glyph_ranges)
    pass
    
    #Autogenerated for ImFontAtlas_AddFontFromMemoryCompressedBase85TTF
    cpdef ImFont* AddFontFromMemoryCompressedBase85TTF(ImFontAtlas* self,const char* compressed_font_data_base85,float size_pixels,const ImFontConfig* font_cfg,const ImWchar* glyph_ranges)
    pass
    
    #Autogenerated for ImFontAtlas_AddFontFromMemoryCompressedTTF
    cpdef ImFont* AddFontFromMemoryCompressedTTF(ImFontAtlas* self,const void* compressed_font_data,int compressed_font_size,float size_pixels,const ImFontConfig* font_cfg,const ImWchar* glyph_ranges)
    pass
    
    #Autogenerated for ImFontAtlas_AddFontFromMemoryTTF
    cpdef ImFont* AddFontFromMemoryTTF(ImFontAtlas* self,void* font_data,int font_size,float size_pixels,const ImFontConfig* font_cfg,const ImWchar* glyph_ranges)
    pass
    
    #Autogenerated for ImFontAtlas_Build
    cpdef bool Build(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_CalcCustomRectUV
    cpdef void CalcCustomRectUV(ImFontAtlas* self,const ImFontAtlasCustomRect* rect,ImVec2* out_uv_min,ImVec2* out_uv_max)
    pass
    
    #Autogenerated for ImFontAtlas_Clear
    cpdef void Clear(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_ClearFonts
    cpdef void ClearFonts(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_ClearInputData
    cpdef void ClearInputData(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_ClearTexData
    cpdef void ClearTexData(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetCustomRectByIndex
    cpdef  ImFontAtlasCustomRect* GetCustomRectByIndex(ImFontAtlas* self,int index)
    pass
    
    #Autogenerated for ImFontAtlas_GetGlyphRangesChineseFull
    cpdef  ImWchar* GetGlyphRangesChineseFull(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon
    cpdef  ImWchar* GetGlyphRangesChineseSimplifiedCommon(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetGlyphRangesCyrillic
    cpdef  ImWchar* GetGlyphRangesCyrillic(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetGlyphRangesDefault
    cpdef  ImWchar* GetGlyphRangesDefault(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetGlyphRangesJapanese
    cpdef  ImWchar* GetGlyphRangesJapanese(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetGlyphRangesKorean
    cpdef  ImWchar* GetGlyphRangesKorean(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetGlyphRangesThai
    cpdef  ImWchar* GetGlyphRangesThai(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetGlyphRangesVietnamese
    cpdef  ImWchar* GetGlyphRangesVietnamese(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_GetMouseCursorTexData
    cpdef bool GetMouseCursorTexData(ImFontAtlas* self,ImGuiMouseCursor cursor,ImVec2* out_offset,ImVec2* out_size,ImVec2 out_uv_border[2],ImVec2 out_uv_fill[2])
    pass
    
    #Autogenerated for ImFontAtlas_GetTexDataAsAlpha8
    cpdef void GetTexDataAsAlpha8(ImFontAtlas* self,unsigned char** out_pixels,int* out_width,int* out_height,int* out_bytes_per_pixel)
    pass
    
    #Autogenerated for ImFontAtlas_GetTexDataAsRGBA32
    cpdef void GetTexDataAsRGBA32(ImFontAtlas* self,unsigned char** out_pixels,int* out_width,int* out_height,int* out_bytes_per_pixel)
    pass
    
    #Autogenerated for ImFontAtlas_ImFontAtlas
    cpdef  ImFontAtlas()
    pass
    
    #Autogenerated for ImFontAtlas_IsBuilt
    cpdef bool IsBuilt(ImFontAtlas* self)
    pass
    
    #Autogenerated for ImFontAtlas_SetTexID
    cpdef void SetTexID(ImFontAtlas* self,ImTextureID id)
    pass
    
    #Autogenerated for ImFontAtlas_destroy
    
    #{'args': '(ImFontAtlas* self)', 'argsT': [{'name': 'self', 'type': 'ImFontAtlas*'}], 'call_args': '(self)', 'cimguiname': 'ImFontAtlas_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImFontAtlas_destroy', 'ret': 'void', 'signature': '(ImFontAtlas*)', 'stname': 'ImFontAtlas'}
    pass
    
    #Autogenerated for ImFontConfig_ImFontConfig
    cpdef  ImFontConfig()
    pass
    
    #Autogenerated for ImFontConfig_destroy
    
    #{'args': '(ImFontConfig* self)', 'argsT': [{'name': 'self', 'type': 'ImFontConfig*'}], 'call_args': '(self)', 'cimguiname': 'ImFontConfig_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImFontConfig_destroy', 'ret': 'void', 'signature': '(ImFontConfig*)', 'stname': 'ImFontConfig'}
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_AddChar
    cpdef void AddChar(ImFontGlyphRangesBuilder* self,ImWchar c)
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_AddRanges
    cpdef void AddRanges(ImFontGlyphRangesBuilder* self,const ImWchar* ranges)
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_AddText
    cpdef void AddText(ImFontGlyphRangesBuilder* self,const char* text,const char* text_end)
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_BuildRanges
    cpdef void BuildRanges(ImFontGlyphRangesBuilder* self,ImVector_ImWchar* out_ranges)
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_Clear
    cpdef void Clear(ImFontGlyphRangesBuilder* self)
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_GetBit
    cpdef bool GetBit(ImFontGlyphRangesBuilder* self,int n)
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder
    cpdef  ImFontGlyphRangesBuilder()
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_SetBit
    cpdef void SetBit(ImFontGlyphRangesBuilder* self,int n)
    pass
    
    #Autogenerated for ImFontGlyphRangesBuilder_destroy
    
    #{'args': '(ImFontGlyphRangesBuilder* self)', 'argsT': [{'name': 'self', 'type': 'ImFontGlyphRangesBuilder*'}], 'call_args': '(self)', 'cimguiname': 'ImFontGlyphRangesBuilder_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImFontGlyphRangesBuilder_destroy', 'ret': 'void', 'signature': '(ImFontGlyphRangesBuilder*)', 'stname': 'ImFontGlyphRangesBuilder'}
    pass
    
    #Autogenerated for ImFont_AddGlyph
    cpdef void AddGlyph(ImFont* self,ImWchar c,float x0,float y0,float x1,float y1,float u0,float v0,float u1,float v1,float advance_x)
    pass
    
    #Autogenerated for ImFont_AddRemapChar
    cpdef void AddRemapChar(ImFont* self,ImWchar dst,ImWchar src,bool overwrite_dst)
    pass
    
    #Autogenerated for ImFont_BuildLookupTable
    cpdef void BuildLookupTable(ImFont* self)
    pass
    
    #Autogenerated for ImFont_CalcTextSizeA
    cpdef ImVec2 CalcTextSizeA(ImFont* self,float size,float max_width,float wrap_width,const char* text_begin,const char* text_end,const char** remaining)
    cpdef void CalcTextSizeA(ImVec2 *pOut,ImFont* self,float size,float max_width,float wrap_width,const char* text_begin,const char* text_end,const char** remaining)
    cpdef ImVec2_Simple CalcTextSizeA(ImFont* self,float size,float max_width,float wrap_width,const char* text_begin,const char* text_end,const char** remaining)
    pass
    
    #Autogenerated for ImFont_CalcWordWrapPositionA
    cpdef  char* CalcWordWrapPositionA(ImFont* self,float scale,const char* text,const char* text_end,float wrap_width)
    pass
    
    #Autogenerated for ImFont_ClearOutputData
    cpdef void ClearOutputData(ImFont* self)
    pass
    
    #Autogenerated for ImFont_FindGlyph
    cpdef  ImFontGlyph* FindGlyph(ImFont* self,ImWchar c)
    pass
    
    #Autogenerated for ImFont_FindGlyphNoFallback
    cpdef  ImFontGlyph* FindGlyphNoFallback(ImFont* self,ImWchar c)
    pass
    
    #Autogenerated for ImFont_GetCharAdvance
    cpdef float GetCharAdvance(ImFont* self,ImWchar c)
    pass
    
    #Autogenerated for ImFont_GetDebugName
    cpdef  char* GetDebugName(ImFont* self)
    pass
    
    #Autogenerated for ImFont_GrowIndex
    cpdef void GrowIndex(ImFont* self,int new_size)
    pass
    
    #Autogenerated for ImFont_ImFont
    cpdef  ImFont()
    pass
    
    #Autogenerated for ImFont_IsLoaded
    cpdef bool IsLoaded(ImFont* self)
    pass
    
    #Autogenerated for ImFont_RenderChar
    cpdef void RenderChar(ImFont* self,ImDrawList* draw_list,float size,ImVec2 pos,ImU32 col,ImWchar c)
    pass
    
    #Autogenerated for ImFont_RenderText
    cpdef void RenderText(ImFont* self,ImDrawList* draw_list,float size,ImVec2 pos,ImU32 col,const ImVec4 clip_rect,const char* text_begin,const char* text_end,float wrap_width,bool cpu_fine_clip)
    pass
    
    #Autogenerated for ImFont_SetFallbackChar
    cpdef void SetFallbackChar(ImFont* self,ImWchar c)
    pass
    
    #Autogenerated for ImFont_destroy
    
    #{'args': '(ImFont* self)', 'argsT': [{'name': 'self', 'type': 'ImFont*'}], 'call_args': '(self)', 'cimguiname': 'ImFont_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImFont_destroy', 'ret': 'void', 'signature': '(ImFont*)', 'stname': 'ImFont'}
    pass
    
    #Autogenerated for ImGuiIO_AddInputCharacter
    cpdef void AddInputCharacter(ImGuiIO* self,unsigned int c)
    pass
    
    #Autogenerated for ImGuiIO_AddInputCharactersUTF8
    cpdef void AddInputCharactersUTF8(ImGuiIO* self,const char* str)
    pass
    
    #Autogenerated for ImGuiIO_ClearInputCharacters
    cpdef void ClearInputCharacters(ImGuiIO* self)
    pass
    
    #Autogenerated for ImGuiIO_ImGuiIO
    cpdef  ImGuiIO()
    pass
    
    #Autogenerated for ImGuiIO_destroy
    
    #{'args': '(ImGuiIO* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiIO*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiIO_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiIO_destroy', 'ret': 'void', 'signature': '(ImGuiIO*)', 'stname': 'ImGuiIO'}
    pass
    
    #Autogenerated for ImGuiInputTextCallbackData_DeleteChars
    cpdef void DeleteChars(ImGuiInputTextCallbackData* self,int pos,int bytes_count)
    pass
    
    #Autogenerated for ImGuiInputTextCallbackData_HasSelection
    cpdef bool HasSelection(ImGuiInputTextCallbackData* self)
    pass
    
    #Autogenerated for ImGuiInputTextCallbackData_ImGuiInputTextCallbackData
    cpdef  ImGuiInputTextCallbackData()
    pass
    
    #Autogenerated for ImGuiInputTextCallbackData_InsertChars
    cpdef void InsertChars(ImGuiInputTextCallbackData* self,int pos,const char* text,const char* text_end)
    pass
    
    #Autogenerated for ImGuiInputTextCallbackData_destroy
    
    #{'args': '(ImGuiInputTextCallbackData* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiInputTextCallbackData*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiInputTextCallbackData_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiInputTextCallbackData_destroy', 'ret': 'void', 'signature': '(ImGuiInputTextCallbackData*)', 'stname': 'ImGuiInputTextCallbackData'}
    pass
    
    #Autogenerated for ImGuiListClipper_Begin
    cpdef void Begin(ImGuiListClipper* self,int items_count,float items_height)
    pass
    
    #Autogenerated for ImGuiListClipper_End
    cpdef void End(ImGuiListClipper* self)
    pass
    
    #Autogenerated for ImGuiListClipper_ImGuiListClipper
    cpdef  ImGuiListClipper(int items_count,float items_height)
    pass
    
    #Autogenerated for ImGuiListClipper_Step
    cpdef bool Step(ImGuiListClipper* self)
    pass
    
    #Autogenerated for ImGuiListClipper_destroy
    
    #{'args': '(ImGuiListClipper* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiListClipper*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiListClipper_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiListClipper_destroy', 'ret': 'void', 'signature': '(ImGuiListClipper*)', 'stname': 'ImGuiListClipper'}
    pass
    
    #Autogenerated for ImGuiOnceUponAFrame_ImGuiOnceUponAFrame
    cpdef  ImGuiOnceUponAFrame()
    pass
    
    #Autogenerated for ImGuiOnceUponAFrame_destroy
    
    #{'args': '(ImGuiOnceUponAFrame* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiOnceUponAFrame*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiOnceUponAFrame_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiOnceUponAFrame_destroy', 'ret': 'void', 'signature': '(ImGuiOnceUponAFrame*)', 'stname': 'ImGuiOnceUponAFrame'}
    pass
    
    #Autogenerated for ImGuiPayload_Clear
    cpdef void Clear(ImGuiPayload* self)
    pass
    
    #Autogenerated for ImGuiPayload_ImGuiPayload
    cpdef  ImGuiPayload()
    pass
    
    #Autogenerated for ImGuiPayload_IsDataType
    cpdef bool IsDataType(ImGuiPayload* self,const char* type)
    pass
    
    #Autogenerated for ImGuiPayload_IsDelivery
    cpdef bool IsDelivery(ImGuiPayload* self)
    pass
    
    #Autogenerated for ImGuiPayload_IsPreview
    cpdef bool IsPreview(ImGuiPayload* self)
    pass
    
    #Autogenerated for ImGuiPayload_destroy
    
    #{'args': '(ImGuiPayload* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiPayload*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiPayload_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiPayload_destroy', 'ret': 'void', 'signature': '(ImGuiPayload*)', 'stname': 'ImGuiPayload'}
    pass
    
    #Autogenerated for ImGuiStoragePair_ImGuiStoragePair
    cpdef  ImGuiStoragePair(ImGuiID _key,int _val_i)
    cpdef  ImGuiStoragePair(ImGuiID _key,float _val_f)
    cpdef  ImGuiStoragePair(ImGuiID _key,void* _val_p)
    pass
    
    #Autogenerated for ImGuiStoragePair_destroy
    
    #{'args': '(ImGuiStoragePair* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiStoragePair*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiStoragePair_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiStoragePair_destroy', 'ret': 'void', 'signature': '(ImGuiStoragePair*)', 'stname': 'ImGuiStoragePair'}
    pass
    
    #Autogenerated for ImGuiStorage_BuildSortByKey
    cpdef void BuildSortByKey(ImGuiStorage* self)
    pass
    
    #Autogenerated for ImGuiStorage_Clear
    cpdef void Clear(ImGuiStorage* self)
    pass
    
    #Autogenerated for ImGuiStorage_GetBool
    cpdef bool GetBool(ImGuiStorage* self,ImGuiID key,bool default_val)
    pass
    
    #Autogenerated for ImGuiStorage_GetBoolRef
    cpdef bool* GetBoolRef(ImGuiStorage* self,ImGuiID key,bool default_val)
    pass
    
    #Autogenerated for ImGuiStorage_GetFloat
    cpdef float GetFloat(ImGuiStorage* self,ImGuiID key,float default_val)
    pass
    
    #Autogenerated for ImGuiStorage_GetFloatRef
    cpdef float* GetFloatRef(ImGuiStorage* self,ImGuiID key,float default_val)
    pass
    
    #Autogenerated for ImGuiStorage_GetInt
    cpdef int GetInt(ImGuiStorage* self,ImGuiID key,int default_val)
    pass
    
    #Autogenerated for ImGuiStorage_GetIntRef
    cpdef int* GetIntRef(ImGuiStorage* self,ImGuiID key,int default_val)
    pass
    
    #Autogenerated for ImGuiStorage_GetVoidPtr
    cpdef void* GetVoidPtr(ImGuiStorage* self,ImGuiID key)
    pass
    
    #Autogenerated for ImGuiStorage_GetVoidPtrRef
    cpdef void** GetVoidPtrRef(ImGuiStorage* self,ImGuiID key,void* default_val)
    pass
    
    #Autogenerated for ImGuiStorage_SetAllInt
    cpdef void SetAllInt(ImGuiStorage* self,int val)
    pass
    
    #Autogenerated for ImGuiStorage_SetBool
    cpdef void SetBool(ImGuiStorage* self,ImGuiID key,bool val)
    pass
    
    #Autogenerated for ImGuiStorage_SetFloat
    cpdef void SetFloat(ImGuiStorage* self,ImGuiID key,float val)
    pass
    
    #Autogenerated for ImGuiStorage_SetInt
    cpdef void SetInt(ImGuiStorage* self,ImGuiID key,int val)
    pass
    
    #Autogenerated for ImGuiStorage_SetVoidPtr
    cpdef void SetVoidPtr(ImGuiStorage* self,ImGuiID key,void* val)
    pass
    
    #Autogenerated for ImGuiStyle_ImGuiStyle
    cpdef  ImGuiStyle()
    pass
    
    #Autogenerated for ImGuiStyle_ScaleAllSizes
    cpdef void ScaleAllSizes(ImGuiStyle* self,float scale_factor)
    pass
    
    #Autogenerated for ImGuiStyle_destroy
    
    #{'args': '(ImGuiStyle* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiStyle*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiStyle_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiStyle_destroy', 'ret': 'void', 'signature': '(ImGuiStyle*)', 'stname': 'ImGuiStyle'}
    pass
    
    #Autogenerated for ImGuiTextBuffer_ImGuiTextBuffer
    cpdef  ImGuiTextBuffer()
    pass
    
    #Autogenerated for ImGuiTextBuffer_append
    cpdef void append(ImGuiTextBuffer* self,const char* str,const char* str_end)
    pass
    
    #Autogenerated for ImGuiTextBuffer_appendf
    cpdef void appendf(ImGuiTextBuffer* self,const char* fmt,...)
    pass
    
    #Autogenerated for ImGuiTextBuffer_appendfv
    cpdef void appendfv(ImGuiTextBuffer* self,const char* fmt,va_list args)
    pass
    
    #Autogenerated for ImGuiTextBuffer_begin
    cpdef  char* begin(ImGuiTextBuffer* self)
    pass
    
    #Autogenerated for ImGuiTextBuffer_c_str
    cpdef  char* c_str(ImGuiTextBuffer* self)
    pass
    
    #Autogenerated for ImGuiTextBuffer_clear
    cpdef void clear(ImGuiTextBuffer* self)
    pass
    
    #Autogenerated for ImGuiTextBuffer_destroy
    
    #{'args': '(ImGuiTextBuffer* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiTextBuffer*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiTextBuffer_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiTextBuffer_destroy', 'ret': 'void', 'signature': '(ImGuiTextBuffer*)', 'stname': 'ImGuiTextBuffer'}
    pass
    
    #Autogenerated for ImGuiTextBuffer_empty
    cpdef bool empty(ImGuiTextBuffer* self)
    pass
    
    #Autogenerated for ImGuiTextBuffer_end
    cpdef  char* end(ImGuiTextBuffer* self)
    pass
    
    #Autogenerated for ImGuiTextBuffer_reserve
    cpdef void reserve(ImGuiTextBuffer* self,int capacity)
    pass
    
    #Autogenerated for ImGuiTextBuffer_size
    cpdef int size(ImGuiTextBuffer* self)
    pass
    
    #Autogenerated for ImGuiTextFilter_Build
    cpdef void Build(ImGuiTextFilter* self)
    pass
    
    #Autogenerated for ImGuiTextFilter_Clear
    cpdef void Clear(ImGuiTextFilter* self)
    pass
    
    #Autogenerated for ImGuiTextFilter_Draw
    cpdef bool Draw(ImGuiTextFilter* self,const char* label,float width)
    pass
    
    #Autogenerated for ImGuiTextFilter_ImGuiTextFilter
    cpdef  ImGuiTextFilter(const char* default_filter)
    pass
    
    #Autogenerated for ImGuiTextFilter_IsActive
    cpdef bool IsActive(ImGuiTextFilter* self)
    pass
    
    #Autogenerated for ImGuiTextFilter_PassFilter
    cpdef bool PassFilter(ImGuiTextFilter* self,const char* text,const char* text_end)
    pass
    
    #Autogenerated for ImGuiTextFilter_destroy
    
    #{'args': '(ImGuiTextFilter* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiTextFilter*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiTextFilter_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiTextFilter_destroy', 'ret': 'void', 'signature': '(ImGuiTextFilter*)', 'stname': 'ImGuiTextFilter'}
    pass
    
    #Autogenerated for ImGuiTextRange_ImGuiTextRange
    cpdef  ImGuiTextRange()
    cpdef  ImGuiTextRange(const char* _b,const char* _e)
    pass
    
    #Autogenerated for ImGuiTextRange_destroy
    
    #{'args': '(ImGuiTextRange* self)', 'argsT': [{'name': 'self', 'type': 'ImGuiTextRange*'}], 'call_args': '(self)', 'cimguiname': 'ImGuiTextRange_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImGuiTextRange_destroy', 'ret': 'void', 'signature': '(ImGuiTextRange*)', 'stname': 'ImGuiTextRange'}
    pass
    
    #Autogenerated for ImGuiTextRange_empty
    cpdef bool empty(ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImGuiTextRange_split
    cpdef void split(ImGuiTextRange* self,char separator,ImVector_ImGuiTextRange* out)
    pass
    
    #Autogenerated for ImVec2_ImVec2
    cpdef  ImVec2()
    cpdef  ImVec2(float _x,float _y)
    pass
    
    #Autogenerated for ImVec2_destroy
    
    #{'args': '(ImVec2* self)', 'argsT': [{'name': 'self', 'type': 'ImVec2*'}], 'call_args': '(self)', 'cimguiname': 'ImVec2_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVec2_destroy', 'ret': 'void', 'signature': '(ImVec2*)', 'stname': 'ImVec2'}
    pass
    
    #Autogenerated for ImVec4_ImVec4
    cpdef  ImVec4()
    cpdef  ImVec4(float _x,float _y,float _z,float _w)
    pass
    
    #Autogenerated for ImVec4_destroy
    
    #{'args': '(ImVec4* self)', 'argsT': [{'name': 'self', 'type': 'ImVec4*'}], 'call_args': '(self)', 'cimguiname': 'ImVec4_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVec4_destroy', 'ret': 'void', 'signature': '(ImVec4*)', 'stname': 'ImVec4'}
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_ImVector_ImDrawChannel
    cpdef  ImVector_ImDrawChannel()
    cpdef  ImVector_ImDrawChannel(const ImVector_ImDrawChannel src)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImDrawChannel* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_back
    cpdef ImDrawChannel* back(ImVector_ImDrawChannel* self)
    cpdef ImDrawChannel * back(const ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_begin
    cpdef ImDrawChannel* begin(ImVector_ImDrawChannel* self)
    cpdef ImDrawChannel * begin(const ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_capacity
    cpdef int capacity(const ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_clear
    cpdef void clear(ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_destroy
    
    #{'args': '(ImVector_ImDrawChannel* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImDrawChannel*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImDrawChannel_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImDrawChannel_destroy', 'ret': 'void', 'signature': '(ImVector_ImDrawChannel*)', 'stname': 'ImVector_ImDrawChannel'}
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_empty
    cpdef bool empty(const ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_end
    cpdef ImDrawChannel* end(ImVector_ImDrawChannel* self)
    cpdef ImDrawChannel * end(const ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_erase
    cpdef ImDrawChannel* erase(ImVector_ImDrawChannel* self,ImDrawChannel * it)
    cpdef ImDrawChannel* erase(ImVector_ImDrawChannel* self,ImDrawChannel * it,ImDrawChannel * it_last)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_erase_unsorted
    cpdef ImDrawChannel* erase_unsorted(ImVector_ImDrawChannel* self,ImDrawChannel * it)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_front
    cpdef ImDrawChannel* front(ImVector_ImDrawChannel* self)
    cpdef ImDrawChannel * front(const ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImDrawChannel* self,ImDrawChannel * it)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_insert
    cpdef ImDrawChannel* insert(ImVector_ImDrawChannel* self,ImDrawChannel * it,const ImDrawChannel v)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_pop_back
    cpdef void pop_back(ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_push_back
    cpdef void push_back(ImVector_ImDrawChannel* self,const ImDrawChannel v)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_push_front
    cpdef void push_front(ImVector_ImDrawChannel* self,const ImDrawChannel v)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_reserve
    cpdef void reserve(ImVector_ImDrawChannel* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_resize
    cpdef void resize(ImVector_ImDrawChannel* self,int new_size)
    cpdef void resize(ImVector_ImDrawChannel* self,int new_size,const ImDrawChannel v)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_size
    cpdef int size(const ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImDrawChannel* self)
    pass
    
    #Autogenerated for ImVector_ImDrawChannel_swap
    cpdef void swap(ImVector_ImDrawChannel* self,ImVector_ImDrawChannel rhs)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_ImVector_ImDrawCmd
    cpdef  ImVector_ImDrawCmd()
    cpdef  ImVector_ImDrawCmd(const ImVector_ImDrawCmd src)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImDrawCmd* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_back
    cpdef ImDrawCmd* back(ImVector_ImDrawCmd* self)
    cpdef ImDrawCmd * back(const ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_begin
    cpdef ImDrawCmd* begin(ImVector_ImDrawCmd* self)
    cpdef ImDrawCmd * begin(const ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_capacity
    cpdef int capacity(const ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_clear
    cpdef void clear(ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_destroy
    
    #{'args': '(ImVector_ImDrawCmd* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImDrawCmd*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImDrawCmd_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImDrawCmd_destroy', 'ret': 'void', 'signature': '(ImVector_ImDrawCmd*)', 'stname': 'ImVector_ImDrawCmd'}
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_empty
    cpdef bool empty(const ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_end
    cpdef ImDrawCmd* end(ImVector_ImDrawCmd* self)
    cpdef ImDrawCmd * end(const ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_erase
    cpdef ImDrawCmd* erase(ImVector_ImDrawCmd* self,ImDrawCmd * it)
    cpdef ImDrawCmd* erase(ImVector_ImDrawCmd* self,ImDrawCmd * it,ImDrawCmd * it_last)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_erase_unsorted
    cpdef ImDrawCmd* erase_unsorted(ImVector_ImDrawCmd* self,ImDrawCmd * it)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_front
    cpdef ImDrawCmd* front(ImVector_ImDrawCmd* self)
    cpdef ImDrawCmd  * front(const ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImDrawCmd* self,ImDrawCmd * it)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_insert
    cpdef ImDrawCmd* insert(ImVector_ImDrawCmd* self,ImDrawCmd * it,const ImDrawCmd v)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_pop_back
    cpdef void pop_back(ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_push_back
    cpdef void push_back(ImVector_ImDrawCmd* self,const ImDrawCmd v)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_push_front
    cpdef void push_front(ImVector_ImDrawCmd* self,const ImDrawCmd v)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_reserve
    cpdef void reserve(ImVector_ImDrawCmd* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_resize
    cpdef void resize(ImVector_ImDrawCmd* self,int new_size)
    cpdef void resize(ImVector_ImDrawCmd* self,int new_size,const ImDrawCmd v)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_size
    cpdef int size(const ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImDrawCmd* self)
    pass
    
    #Autogenerated for ImVector_ImDrawCmd_swap
    cpdef void swap(ImVector_ImDrawCmd* self,ImVector_ImDrawCmd rhs)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_ImVector_ImDrawIdx
    cpdef  ImVector_ImDrawIdx()
    cpdef  ImVector_ImDrawIdx(const ImVector_ImDrawIdx src)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImDrawIdx* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_back
    cpdef ImDrawIdx* back(ImVector_ImDrawIdx* self)
    cpdef ImDrawIdx  * back(const ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_begin
    cpdef ImDrawIdx* begin(ImVector_ImDrawIdx* self)
    cpdef ImDrawIdx  * begin(const ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_capacity
    cpdef int capacity(const ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_clear
    cpdef void clear(ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_destroy
    
    #{'args': '(ImVector_ImDrawIdx* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImDrawIdx*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImDrawIdx_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImDrawIdx_destroy', 'ret': 'void', 'signature': '(ImVector_ImDrawIdx*)', 'stname': 'ImVector_ImDrawIdx'}
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_empty
    cpdef bool empty(const ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_end
    cpdef ImDrawIdx* end(ImVector_ImDrawIdx* self)
    cpdef ImDrawIdx  * end(const ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_erase
    cpdef ImDrawIdx* erase(ImVector_ImDrawIdx* self,ImDrawIdx * it)
    cpdef ImDrawIdx* erase(ImVector_ImDrawIdx* self,ImDrawIdx * it,ImDrawIdx * it_last)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_erase_unsorted
    cpdef ImDrawIdx* erase_unsorted(ImVector_ImDrawIdx* self,ImDrawIdx * it)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_front
    cpdef ImDrawIdx* front(ImVector_ImDrawIdx* self)
    cpdef ImDrawIdx  * front(const ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImDrawIdx* self,ImDrawIdx * it)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_insert
    cpdef ImDrawIdx* insert(ImVector_ImDrawIdx* self,ImDrawIdx * it,const ImDrawIdx v)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_pop_back
    cpdef void pop_back(ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_push_back
    cpdef void push_back(ImVector_ImDrawIdx* self,const ImDrawIdx v)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_push_front
    cpdef void push_front(ImVector_ImDrawIdx* self,const ImDrawIdx v)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_reserve
    cpdef void reserve(ImVector_ImDrawIdx* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_resize
    cpdef void resize(ImVector_ImDrawIdx* self,int new_size)
    cpdef void resize(ImVector_ImDrawIdx* self,int new_size,const ImDrawIdx v)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_size
    cpdef int size(const ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImDrawIdx* self)
    pass
    
    #Autogenerated for ImVector_ImDrawIdx_swap
    cpdef void swap(ImVector_ImDrawIdx* self,ImVector_ImDrawIdx rhs)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_ImVector_ImDrawVert
    cpdef  ImVector_ImDrawVert()
    cpdef  ImVector_ImDrawVert(const ImVector_ImDrawVert src)
    pass
    
    #Autogenerated for ImVector_ImDrawVert__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImDrawVert* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_back
    cpdef ImDrawVert* back(ImVector_ImDrawVert* self)
    cpdef ImDrawVert  * back(const ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_begin
    cpdef ImDrawVert* begin(ImVector_ImDrawVert* self)
    cpdef ImDrawVert  * begin(const ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_capacity
    cpdef int capacity(const ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_clear
    cpdef void clear(ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_destroy
    
    #{'args': '(ImVector_ImDrawVert* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImDrawVert*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImDrawVert_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImDrawVert_destroy', 'ret': 'void', 'signature': '(ImVector_ImDrawVert*)', 'stname': 'ImVector_ImDrawVert'}
    pass
    
    #Autogenerated for ImVector_ImDrawVert_empty
    cpdef bool empty(const ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_end
    cpdef ImDrawVert* end(ImVector_ImDrawVert* self)
    cpdef ImDrawVert  * end(const ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_erase
    cpdef ImDrawVert* erase(ImVector_ImDrawVert* self,ImDrawVert * it)
    cpdef ImDrawVert* erase(ImVector_ImDrawVert* self,ImDrawVert * it,ImDrawVert * it_last)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_erase_unsorted
    cpdef ImDrawVert* erase_unsorted(ImVector_ImDrawVert* self,ImDrawVert * it)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_front
    cpdef ImDrawVert* front(ImVector_ImDrawVert* self)
    cpdef ImDrawVert  * front(const ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImDrawVert* self,ImDrawVert * it)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_insert
    cpdef ImDrawVert* insert(ImVector_ImDrawVert* self,ImDrawVert * it,const ImDrawVert v)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_pop_back
    cpdef void pop_back(ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_push_back
    cpdef void push_back(ImVector_ImDrawVert* self,const ImDrawVert v)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_push_front
    cpdef void push_front(ImVector_ImDrawVert* self,const ImDrawVert v)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_reserve
    cpdef void reserve(ImVector_ImDrawVert* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_resize
    cpdef void resize(ImVector_ImDrawVert* self,int new_size)
    cpdef void resize(ImVector_ImDrawVert* self,int new_size,const ImDrawVert v)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_size
    cpdef int size(const ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImDrawVert* self)
    pass
    
    #Autogenerated for ImVector_ImDrawVert_swap
    cpdef void swap(ImVector_ImDrawVert* self,ImVector_ImDrawVert rhs)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_ImVector_ImFontAtlasCustomRect
    cpdef  ImVector_ImFontAtlasCustomRect()
    cpdef  ImVector_ImFontAtlasCustomRect(const ImVector_ImFontAtlasCustomRect src)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImFontAtlasCustomRect* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_back
    cpdef ImFontAtlasCustomRect* back(ImVector_ImFontAtlasCustomRect* self)
    cpdef ImFontAtlasCustomRect  * back(const ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_begin
    cpdef ImFontAtlasCustomRect* begin(ImVector_ImFontAtlasCustomRect* self)
    cpdef ImFontAtlasCustomRect  * begin(const ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_capacity
    cpdef int capacity(const ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_clear
    cpdef void clear(ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_destroy
    
    #{'args': '(ImVector_ImFontAtlasCustomRect* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImFontAtlasCustomRect*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImFontAtlasCustomRect_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImFontAtlasCustomRect_destroy', 'ret': 'void', 'signature': '(ImVector_ImFontAtlasCustomRect*)', 'stname': 'ImVector_ImFontAtlasCustomRect'}
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_empty
    cpdef bool empty(const ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_end
    cpdef ImFontAtlasCustomRect* end(ImVector_ImFontAtlasCustomRect* self)
    cpdef ImFontAtlasCustomRect  * end(const ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_erase
    cpdef ImFontAtlasCustomRect* erase(ImVector_ImFontAtlasCustomRect* self,ImFontAtlasCustomRect * it)
    cpdef ImFontAtlasCustomRect* erase(ImVector_ImFontAtlasCustomRect* self,ImFontAtlasCustomRect * it,ImFontAtlasCustomRect * it_last)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_erase_unsorted
    cpdef ImFontAtlasCustomRect* erase_unsorted(ImVector_ImFontAtlasCustomRect* self,ImFontAtlasCustomRect * it)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_front
    cpdef ImFontAtlasCustomRect* front(ImVector_ImFontAtlasCustomRect* self)
    cpdef ImFontAtlasCustomRect  * front(const ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImFontAtlasCustomRect* self,ImFontAtlasCustomRect * it)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_insert
    cpdef ImFontAtlasCustomRect* insert(ImVector_ImFontAtlasCustomRect* self,ImFontAtlasCustomRect * it,const ImFontAtlasCustomRect v)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_pop_back
    cpdef void pop_back(ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_push_back
    cpdef void push_back(ImVector_ImFontAtlasCustomRect* self,const ImFontAtlasCustomRect v)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_push_front
    cpdef void push_front(ImVector_ImFontAtlasCustomRect* self,const ImFontAtlasCustomRect v)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_reserve
    cpdef void reserve(ImVector_ImFontAtlasCustomRect* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_resize
    cpdef void resize(ImVector_ImFontAtlasCustomRect* self,int new_size)
    cpdef void resize(ImVector_ImFontAtlasCustomRect* self,int new_size,const ImFontAtlasCustomRect v)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_size
    cpdef int size(const ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImFontAtlasCustomRect* self)
    pass
    
    #Autogenerated for ImVector_ImFontAtlasCustomRect_swap
    cpdef void swap(ImVector_ImFontAtlasCustomRect* self,ImVector_ImFontAtlasCustomRect rhs)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_ImVector_ImFontConfig
    cpdef  ImVector_ImFontConfig()
    cpdef  ImVector_ImFontConfig(const ImVector_ImFontConfig src)
    pass
    
    #Autogenerated for ImVector_ImFontConfig__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImFontConfig* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_back
    cpdef ImFontConfig* back(ImVector_ImFontConfig* self)
    cpdef ImFontConfig  * back(const ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_begin
    cpdef ImFontConfig* begin(ImVector_ImFontConfig* self)
    cpdef ImFontConfig  * begin(const ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_capacity
    cpdef int capacity(const ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_clear
    cpdef void clear(ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_destroy
    
    #{'args': '(ImVector_ImFontConfig* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImFontConfig*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImFontConfig_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImFontConfig_destroy', 'ret': 'void', 'signature': '(ImVector_ImFontConfig*)', 'stname': 'ImVector_ImFontConfig'}
    pass
    
    #Autogenerated for ImVector_ImFontConfig_empty
    cpdef bool empty(const ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_end
    cpdef ImFontConfig* end(ImVector_ImFontConfig* self)
    cpdef ImFontConfig  * end(const ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_erase
    cpdef ImFontConfig* erase(ImVector_ImFontConfig* self,ImFontConfig * it)
    cpdef ImFontConfig* erase(ImVector_ImFontConfig* self,ImFontConfig * it,ImFontConfig * it_last)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_erase_unsorted
    cpdef ImFontConfig* erase_unsorted(ImVector_ImFontConfig* self,ImFontConfig * it)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_front
    cpdef ImFontConfig* front(ImVector_ImFontConfig* self)
    cpdef ImFontConfig  * front(const ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImFontConfig* self,ImFontConfig * it)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_insert
    cpdef ImFontConfig* insert(ImVector_ImFontConfig* self,ImFontConfig * it,const ImFontConfig v)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_pop_back
    cpdef void pop_back(ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_push_back
    cpdef void push_back(ImVector_ImFontConfig* self,const ImFontConfig v)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_push_front
    cpdef void push_front(ImVector_ImFontConfig* self,const ImFontConfig v)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_reserve
    cpdef void reserve(ImVector_ImFontConfig* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_resize
    cpdef void resize(ImVector_ImFontConfig* self,int new_size)
    cpdef void resize(ImVector_ImFontConfig* self,int new_size,const ImFontConfig v)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_size
    cpdef int size(const ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImFontConfig* self)
    pass
    
    #Autogenerated for ImVector_ImFontConfig_swap
    cpdef void swap(ImVector_ImFontConfig* self,ImVector_ImFontConfig rhs)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_ImVector_ImFontGlyph
    cpdef  ImVector_ImFontGlyph()
    cpdef  ImVector_ImFontGlyph(const ImVector_ImFontGlyph src)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImFontGlyph* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_back
    cpdef ImFontGlyph* back(ImVector_ImFontGlyph* self)
    cpdef ImFontGlyph  * back(const ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_begin
    cpdef ImFontGlyph* begin(ImVector_ImFontGlyph* self)
    cpdef ImFontGlyph  * begin(const ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_capacity
    cpdef int capacity(const ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_clear
    cpdef void clear(ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_destroy
    
    #{'args': '(ImVector_ImFontGlyph* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImFontGlyph*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImFontGlyph_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImFontGlyph_destroy', 'ret': 'void', 'signature': '(ImVector_ImFontGlyph*)', 'stname': 'ImVector_ImFontGlyph'}
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_empty
    cpdef bool empty(const ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_end
    cpdef ImFontGlyph* end(ImVector_ImFontGlyph* self)
    cpdef ImFontGlyph  * end(const ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_erase
    cpdef ImFontGlyph* erase(ImVector_ImFontGlyph* self,ImFontGlyph * it)
    cpdef ImFontGlyph* erase(ImVector_ImFontGlyph* self,ImFontGlyph * it,ImFontGlyph * it_last)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_erase_unsorted
    cpdef ImFontGlyph* erase_unsorted(ImVector_ImFontGlyph* self,ImFontGlyph * it)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_front
    cpdef ImFontGlyph* front(ImVector_ImFontGlyph* self)
    cpdef ImFontGlyph  * front(const ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImFontGlyph* self,ImFontGlyph * it)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_insert
    cpdef ImFontGlyph* insert(ImVector_ImFontGlyph* self,ImFontGlyph * it,const ImFontGlyph v)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_pop_back
    cpdef void pop_back(ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_push_back
    cpdef void push_back(ImVector_ImFontGlyph* self,const ImFontGlyph v)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_push_front
    cpdef void push_front(ImVector_ImFontGlyph* self,const ImFontGlyph v)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_reserve
    cpdef void reserve(ImVector_ImFontGlyph* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_resize
    cpdef void resize(ImVector_ImFontGlyph* self,int new_size)
    cpdef void resize(ImVector_ImFontGlyph* self,int new_size,const ImFontGlyph v)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_size
    cpdef int size(const ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImFontGlyph* self)
    pass
    
    #Autogenerated for ImVector_ImFontGlyph_swap
    cpdef void swap(ImVector_ImFontGlyph* self,ImVector_ImFontGlyph rhs)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_ImVector_ImFontPtr
    cpdef  ImVector_ImFontPtr()
    cpdef  ImVector_ImFontPtr(const ImVector_ImFontPtr src)
    pass
    
    #Autogenerated for ImVector_ImFontPtr__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImFontPtr* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_back
    cpdef ImFont** back(ImVector_ImFontPtr* self)
    cpdef ImFont*  * back(const ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_begin
    cpdef ImFont** begin(ImVector_ImFontPtr* self)
    cpdef ImFont*  * begin(const ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_capacity
    cpdef int capacity(const ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_clear
    cpdef void clear(ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_destroy
    
    #{'args': '(ImVector_ImFontPtr* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImFontPtr*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImFontPtr_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImFontPtr_destroy', 'ret': 'void', 'signature': '(ImVector_ImFontPtr*)', 'stname': 'ImVector_ImFontPtr'}
    pass
    
    #Autogenerated for ImVector_ImFontPtr_empty
    cpdef bool empty(const ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_end
    cpdef ImFont** end(ImVector_ImFontPtr* self)
    cpdef ImFont*  * end(const ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_erase
    cpdef ImFont** erase(ImVector_ImFontPtr* self,ImFont* * it)
    cpdef ImFont** erase(ImVector_ImFontPtr* self,ImFont* * it,ImFont* * it_last)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_erase_unsorted
    cpdef ImFont** erase_unsorted(ImVector_ImFontPtr* self,ImFont* * it)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_front
    cpdef ImFont** front(ImVector_ImFontPtr* self)
    cpdef ImFont*  * front(const ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImFontPtr* self,ImFont* * it)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_insert
    cpdef ImFont** insert(ImVector_ImFontPtr* self,ImFont* * it,ImFont* const  v)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_pop_back
    cpdef void pop_back(ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_push_back
    cpdef void push_back(ImVector_ImFontPtr* self,ImFont* const  v)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_push_front
    cpdef void push_front(ImVector_ImFontPtr* self,ImFont* const  v)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_reserve
    cpdef void reserve(ImVector_ImFontPtr* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_resize
    cpdef void resize(ImVector_ImFontPtr* self,int new_size)
    cpdef void resize(ImVector_ImFontPtr* self,int new_size,ImFont* const  v)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_size
    cpdef int size(const ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImFontPtr* self)
    pass
    
    #Autogenerated for ImVector_ImFontPtr_swap
    cpdef void swap(ImVector_ImFontPtr* self,ImVector_ImFontPtr rhs)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_ImVector_ImGuiStoragePair
    cpdef  ImVector_ImGuiStoragePair()
    cpdef  ImVector_ImGuiStoragePair(const ImVector_ImGuiStoragePair src)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImGuiStoragePair* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_back
    cpdef ImGuiStoragePair* back(ImVector_ImGuiStoragePair* self)
    cpdef ImGuiStoragePair  * back(const ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_begin
    cpdef ImGuiStoragePair* begin(ImVector_ImGuiStoragePair* self)
    cpdef ImGuiStoragePair  * begin(const ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_capacity
    cpdef int capacity(const ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_clear
    cpdef void clear(ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_destroy
    
    #{'args': '(ImVector_ImGuiStoragePair* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImGuiStoragePair*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImGuiStoragePair_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImGuiStoragePair_destroy', 'ret': 'void', 'signature': '(ImVector_ImGuiStoragePair*)', 'stname': 'ImVector_ImGuiStoragePair'}
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_empty
    cpdef bool empty(const ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_end
    cpdef ImGuiStoragePair* end(ImVector_ImGuiStoragePair* self)
    cpdef ImGuiStoragePair  * end(const ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_erase
    cpdef ImGuiStoragePair* erase(ImVector_ImGuiStoragePair* self,ImGuiStoragePair * it)
    cpdef ImGuiStoragePair* erase(ImVector_ImGuiStoragePair* self,ImGuiStoragePair * it,ImGuiStoragePair * it_last)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_erase_unsorted
    cpdef ImGuiStoragePair* erase_unsorted(ImVector_ImGuiStoragePair* self,ImGuiStoragePair * it)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_front
    cpdef ImGuiStoragePair* front(ImVector_ImGuiStoragePair* self)
    cpdef ImGuiStoragePair  * front(const ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImGuiStoragePair* self,ImGuiStoragePair * it)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_insert
    cpdef ImGuiStoragePair* insert(ImVector_ImGuiStoragePair* self,ImGuiStoragePair * it,const ImGuiStoragePair v)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_pop_back
    cpdef void pop_back(ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_push_back
    cpdef void push_back(ImVector_ImGuiStoragePair* self,const ImGuiStoragePair v)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_push_front
    cpdef void push_front(ImVector_ImGuiStoragePair* self,const ImGuiStoragePair v)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_reserve
    cpdef void reserve(ImVector_ImGuiStoragePair* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_resize
    cpdef void resize(ImVector_ImGuiStoragePair* self,int new_size)
    cpdef void resize(ImVector_ImGuiStoragePair* self,int new_size,const ImGuiStoragePair v)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_size
    cpdef int size(const ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImGuiStoragePair* self)
    pass
    
    #Autogenerated for ImVector_ImGuiStoragePair_swap
    cpdef void swap(ImVector_ImGuiStoragePair* self,ImVector_ImGuiStoragePair rhs)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_ImVector_ImGuiTextRange
    cpdef  ImVector_ImGuiTextRange()
    cpdef  ImVector_ImGuiTextRange(const ImVector_ImGuiTextRange src)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImGuiTextRange* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_back
    cpdef ImGuiTextRange* back(ImVector_ImGuiTextRange* self)
    cpdef ImGuiTextRange  * back(const ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_begin
    cpdef ImGuiTextRange* begin(ImVector_ImGuiTextRange* self)
    cpdef ImGuiTextRange  * begin(const ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_capacity
    cpdef int capacity(const ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_clear
    cpdef void clear(ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_destroy
    
    #{'args': '(ImVector_ImGuiTextRange* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImGuiTextRange*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImGuiTextRange_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImGuiTextRange_destroy', 'ret': 'void', 'signature': '(ImVector_ImGuiTextRange*)', 'stname': 'ImVector_ImGuiTextRange'}
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_empty
    cpdef bool empty(const ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_end
    cpdef ImGuiTextRange* end(ImVector_ImGuiTextRange* self)
    cpdef ImGuiTextRange  * end(const ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_erase
    cpdef ImGuiTextRange* erase(ImVector_ImGuiTextRange* self,ImGuiTextRange * it)
    cpdef ImGuiTextRange* erase(ImVector_ImGuiTextRange* self,ImGuiTextRange * it,ImGuiTextRange * it_last)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_erase_unsorted
    cpdef ImGuiTextRange* erase_unsorted(ImVector_ImGuiTextRange* self,ImGuiTextRange * it)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_front
    cpdef ImGuiTextRange* front(ImVector_ImGuiTextRange* self)
    cpdef ImGuiTextRange  * front(const ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImGuiTextRange* self,ImGuiTextRange * it)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_insert
    cpdef ImGuiTextRange* insert(ImVector_ImGuiTextRange* self,ImGuiTextRange * it,const ImGuiTextRange v)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_pop_back
    cpdef void pop_back(ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_push_back
    cpdef void push_back(ImVector_ImGuiTextRange* self,const ImGuiTextRange v)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_push_front
    cpdef void push_front(ImVector_ImGuiTextRange* self,const ImGuiTextRange v)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_reserve
    cpdef void reserve(ImVector_ImGuiTextRange* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_resize
    cpdef void resize(ImVector_ImGuiTextRange* self,int new_size)
    cpdef void resize(ImVector_ImGuiTextRange* self,int new_size,const ImGuiTextRange v)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_size
    cpdef int size(const ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImGuiTextRange* self)
    pass
    
    #Autogenerated for ImVector_ImGuiTextRange_swap
    cpdef void swap(ImVector_ImGuiTextRange* self,ImVector_ImGuiTextRange rhs)
    pass
    
    #Autogenerated for ImVector_ImTextureID_ImVector_ImTextureID
    cpdef  ImVector_ImTextureID()
    cpdef  ImVector_ImTextureID(const ImVector_ImTextureID src)
    pass
    
    #Autogenerated for ImVector_ImTextureID__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImTextureID* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImTextureID_back
    cpdef ImTextureID* back(ImVector_ImTextureID* self)
    cpdef ImTextureID  * back(const ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_begin
    cpdef ImTextureID* begin(ImVector_ImTextureID* self)
    cpdef ImTextureID  * begin(const ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_capacity
    cpdef int capacity(const ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_clear
    cpdef void clear(ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_destroy
    
    #{'args': '(ImVector_ImTextureID* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImTextureID*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImTextureID_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImTextureID_destroy', 'ret': 'void', 'signature': '(ImVector_ImTextureID*)', 'stname': 'ImVector_ImTextureID'}
    pass
    
    #Autogenerated for ImVector_ImTextureID_empty
    cpdef bool empty(const ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_end
    cpdef ImTextureID* end(ImVector_ImTextureID* self)
    cpdef ImTextureID  * end(const ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_erase
    cpdef ImTextureID* erase(ImVector_ImTextureID* self,ImTextureID * it)
    cpdef ImTextureID* erase(ImVector_ImTextureID* self,ImTextureID * it,ImTextureID * it_last)
    pass
    
    #Autogenerated for ImVector_ImTextureID_erase_unsorted
    cpdef ImTextureID* erase_unsorted(ImVector_ImTextureID* self,ImTextureID * it)
    pass
    
    #Autogenerated for ImVector_ImTextureID_front
    cpdef ImTextureID* front(ImVector_ImTextureID* self)
    cpdef ImTextureID  * front(const ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImTextureID* self,ImTextureID * it)
    pass
    
    #Autogenerated for ImVector_ImTextureID_insert
    cpdef ImTextureID* insert(ImVector_ImTextureID* self,ImTextureID * it,const ImTextureID v)
    pass
    
    #Autogenerated for ImVector_ImTextureID_pop_back
    cpdef void pop_back(ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_push_back
    cpdef void push_back(ImVector_ImTextureID* self,const ImTextureID v)
    pass
    
    #Autogenerated for ImVector_ImTextureID_push_front
    cpdef void push_front(ImVector_ImTextureID* self,const ImTextureID v)
    pass
    
    #Autogenerated for ImVector_ImTextureID_reserve
    cpdef void reserve(ImVector_ImTextureID* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImTextureID_resize
    cpdef void resize(ImVector_ImTextureID* self,int new_size)
    cpdef void resize(ImVector_ImTextureID* self,int new_size,const ImTextureID v)
    pass
    
    #Autogenerated for ImVector_ImTextureID_size
    cpdef int size(const ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImTextureID* self)
    pass
    
    #Autogenerated for ImVector_ImTextureID_swap
    cpdef void swap(ImVector_ImTextureID* self,ImVector_ImTextureID rhs)
    pass
    
    #Autogenerated for ImVector_ImU32_ImVector_ImU32
    cpdef  ImVector_ImU32()
    cpdef  ImVector_ImU32(const ImVector_ImU32 src)
    pass
    
    #Autogenerated for ImVector_ImU32__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImU32* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImU32_back
    cpdef ImU32* back(ImVector_ImU32* self)
    cpdef ImU32  * back(const ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_begin
    cpdef ImU32* begin(ImVector_ImU32* self)
    cpdef ImU32  * begin(const ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_capacity
    cpdef int capacity(const ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_clear
    cpdef void clear(ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_destroy
    
    #{'args': '(ImVector_ImU32* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImU32*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImU32_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImU32_destroy', 'ret': 'void', 'signature': '(ImVector_ImU32*)', 'stname': 'ImVector_ImU32'}
    pass
    
    #Autogenerated for ImVector_ImU32_empty
    cpdef bool empty(const ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_end
    cpdef ImU32* end(ImVector_ImU32* self)
    cpdef ImU32  * end(const ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_erase
    cpdef ImU32* erase(ImVector_ImU32* self,ImU32 * it)
    cpdef ImU32* erase(ImVector_ImU32* self,ImU32 * it,ImU32 * it_last)
    pass
    
    #Autogenerated for ImVector_ImU32_erase_unsorted
    cpdef ImU32* erase_unsorted(ImVector_ImU32* self,ImU32 * it)
    pass
    
    #Autogenerated for ImVector_ImU32_front
    cpdef ImU32* front(ImVector_ImU32* self)
    cpdef ImU32  * front(const ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImU32* self,ImU32 * it)
    pass
    
    #Autogenerated for ImVector_ImU32_insert
    cpdef ImU32* insert(ImVector_ImU32* self,ImU32 * it,const ImU32 v)
    pass
    
    #Autogenerated for ImVector_ImU32_pop_back
    cpdef void pop_back(ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_push_back
    cpdef void push_back(ImVector_ImU32* self,const ImU32 v)
    pass
    
    #Autogenerated for ImVector_ImU32_push_front
    cpdef void push_front(ImVector_ImU32* self,const ImU32 v)
    pass
    
    #Autogenerated for ImVector_ImU32_reserve
    cpdef void reserve(ImVector_ImU32* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImU32_resize
    cpdef void resize(ImVector_ImU32* self,int new_size)
    cpdef void resize(ImVector_ImU32* self,int new_size,const ImU32 v)
    pass
    
    #Autogenerated for ImVector_ImU32_size
    cpdef int size(const ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImU32* self)
    pass
    
    #Autogenerated for ImVector_ImU32_swap
    cpdef void swap(ImVector_ImU32* self,ImVector_ImU32 rhs)
    pass
    
    #Autogenerated for ImVector_ImVec2_ImVector_ImVec2
    cpdef  ImVector_ImVec2()
    cpdef  ImVector_ImVec2(const ImVector_ImVec2 src)
    pass
    
    #Autogenerated for ImVector_ImVec2__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImVec2* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImVec2_back
    cpdef ImVec2* back(ImVector_ImVec2* self)
    cpdef ImVec2  * back(const ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_begin
    cpdef ImVec2* begin(ImVector_ImVec2* self)
    cpdef ImVec2  * begin(const ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_capacity
    cpdef int capacity(const ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_clear
    cpdef void clear(ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_destroy
    
    #{'args': '(ImVector_ImVec2* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImVec2*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImVec2_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImVec2_destroy', 'ret': 'void', 'signature': '(ImVector_ImVec2*)', 'stname': 'ImVector_ImVec2'}
    pass
    
    #Autogenerated for ImVector_ImVec2_empty
    cpdef bool empty(const ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_end
    cpdef ImVec2* end(ImVector_ImVec2* self)
    cpdef ImVec2  * end(const ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_erase
    cpdef ImVec2* erase(ImVector_ImVec2* self,ImVec2 * it)
    cpdef ImVec2* erase(ImVector_ImVec2* self,ImVec2 * it,ImVec2 * it_last)
    pass
    
    #Autogenerated for ImVector_ImVec2_erase_unsorted
    cpdef ImVec2* erase_unsorted(ImVector_ImVec2* self,ImVec2 * it)
    pass
    
    #Autogenerated for ImVector_ImVec2_front
    cpdef ImVec2* front(ImVector_ImVec2* self)
    cpdef ImVec2  * front(const ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImVec2* self,ImVec2 * it)
    pass
    
    #Autogenerated for ImVector_ImVec2_insert
    cpdef ImVec2* insert(ImVector_ImVec2* self,ImVec2 * it,const ImVec2 v)
    pass
    
    #Autogenerated for ImVector_ImVec2_pop_back
    cpdef void pop_back(ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_push_back
    cpdef void push_back(ImVector_ImVec2* self,const ImVec2 v)
    pass
    
    #Autogenerated for ImVector_ImVec2_push_front
    cpdef void push_front(ImVector_ImVec2* self,const ImVec2 v)
    pass
    
    #Autogenerated for ImVector_ImVec2_reserve
    cpdef void reserve(ImVector_ImVec2* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImVec2_resize
    cpdef void resize(ImVector_ImVec2* self,int new_size)
    cpdef void resize(ImVector_ImVec2* self,int new_size,const ImVec2 v)
    pass
    
    #Autogenerated for ImVector_ImVec2_size
    cpdef int size(const ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImVec2* self)
    pass
    
    #Autogenerated for ImVector_ImVec2_swap
    cpdef void swap(ImVector_ImVec2* self,ImVector_ImVec2 rhs)
    pass
    
    #Autogenerated for ImVector_ImVec4_ImVector_ImVec4
    cpdef  ImVector_ImVec4()
    cpdef  ImVector_ImVec4(const ImVector_ImVec4 src)
    pass
    
    #Autogenerated for ImVector_ImVec4__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImVec4* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImVec4_back
    cpdef ImVec4* back(ImVector_ImVec4* self)
    cpdef ImVec4  * back(const ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_begin
    cpdef ImVec4* begin(ImVector_ImVec4* self)
    cpdef ImVec4  * begin(const ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_capacity
    cpdef int capacity(const ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_clear
    cpdef void clear(ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_destroy
    
    #{'args': '(ImVector_ImVec4* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImVec4*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImVec4_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImVec4_destroy', 'ret': 'void', 'signature': '(ImVector_ImVec4*)', 'stname': 'ImVector_ImVec4'}
    pass
    
    #Autogenerated for ImVector_ImVec4_empty
    cpdef bool empty(const ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_end
    cpdef ImVec4* end(ImVector_ImVec4* self)
    cpdef ImVec4  * end(const ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_erase
    cpdef ImVec4* erase(ImVector_ImVec4* self,ImVec4 * it)
    cpdef ImVec4* erase(ImVector_ImVec4* self,ImVec4 * it,ImVec4 * it_last)
    pass
    
    #Autogenerated for ImVector_ImVec4_erase_unsorted
    cpdef ImVec4* erase_unsorted(ImVector_ImVec4* self,ImVec4 * it)
    pass
    
    #Autogenerated for ImVector_ImVec4_front
    cpdef ImVec4* front(ImVector_ImVec4* self)
    cpdef ImVec4  * front(const ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImVec4* self,ImVec4 * it)
    pass
    
    #Autogenerated for ImVector_ImVec4_insert
    cpdef ImVec4* insert(ImVector_ImVec4* self,ImVec4 * it,const ImVec4 v)
    pass
    
    #Autogenerated for ImVector_ImVec4_pop_back
    cpdef void pop_back(ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_push_back
    cpdef void push_back(ImVector_ImVec4* self,const ImVec4 v)
    pass
    
    #Autogenerated for ImVector_ImVec4_push_front
    cpdef void push_front(ImVector_ImVec4* self,const ImVec4 v)
    pass
    
    #Autogenerated for ImVector_ImVec4_reserve
    cpdef void reserve(ImVector_ImVec4* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImVec4_resize
    cpdef void resize(ImVector_ImVec4* self,int new_size)
    cpdef void resize(ImVector_ImVec4* self,int new_size,const ImVec4 v)
    pass
    
    #Autogenerated for ImVector_ImVec4_size
    cpdef int size(const ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImVec4* self)
    pass
    
    #Autogenerated for ImVector_ImVec4_swap
    cpdef void swap(ImVector_ImVec4* self,ImVector_ImVec4 rhs)
    pass
    
    #Autogenerated for ImVector_ImVector
    cpdef  ImVector()
    cpdef  ImVector(const ImVector src)
    pass
    
    #Autogenerated for ImVector_ImWchar_ImVector_ImWchar
    cpdef  ImVector_ImWchar()
    cpdef  ImVector_ImWchar(const ImVector_ImWchar src)
    pass
    
    #Autogenerated for ImVector_ImWchar__grow_capacity
    cpdef int _grow_capacity(const ImVector_ImWchar* self,int sz)
    pass
    
    #Autogenerated for ImVector_ImWchar_back
    cpdef ImWchar* back(ImVector_ImWchar* self)
    cpdef ImWchar  * back(const ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_begin
    cpdef ImWchar* begin(ImVector_ImWchar* self)
    cpdef ImWchar  * begin(const ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_capacity
    cpdef int capacity(const ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_clear
    cpdef void clear(ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_contains
    cpdef bool contains(const ImVector_ImWchar* self,const ImWchar v)
    pass
    
    #Autogenerated for ImVector_ImWchar_destroy
    
    #{'args': '(ImVector_ImWchar* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_ImWchar*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_ImWchar_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_ImWchar_destroy', 'ret': 'void', 'signature': '(ImVector_ImWchar*)', 'stname': 'ImVector_ImWchar'}
    pass
    
    #Autogenerated for ImVector_ImWchar_empty
    cpdef bool empty(const ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_end
    cpdef ImWchar* end(ImVector_ImWchar* self)
    cpdef ImWchar  * end(const ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_erase
    cpdef ImWchar* erase(ImVector_ImWchar* self,ImWchar * it)
    cpdef ImWchar* erase(ImVector_ImWchar* self,ImWchar * it,ImWchar * it_last)
    pass
    
    #Autogenerated for ImVector_ImWchar_erase_unsorted
    cpdef ImWchar* erase_unsorted(ImVector_ImWchar* self,ImWchar * it)
    pass
    
    #Autogenerated for ImVector_ImWchar_front
    cpdef ImWchar* front(ImVector_ImWchar* self)
    cpdef ImWchar  * front(const ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_index_from_ptr
    cpdef int index_from_ptr(const ImVector_ImWchar* self,ImWchar * it)
    pass
    
    #Autogenerated for ImVector_ImWchar_insert
    cpdef ImWchar* insert(ImVector_ImWchar* self,ImWchar * it,const ImWchar v)
    pass
    
    #Autogenerated for ImVector_ImWchar_pop_back
    cpdef void pop_back(ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_push_back
    cpdef void push_back(ImVector_ImWchar* self,const ImWchar v)
    pass
    
    #Autogenerated for ImVector_ImWchar_push_front
    cpdef void push_front(ImVector_ImWchar* self,const ImWchar v)
    pass
    
    #Autogenerated for ImVector_ImWchar_reserve
    cpdef void reserve(ImVector_ImWchar* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_ImWchar_resize
    cpdef void resize(ImVector_ImWchar* self,int new_size)
    cpdef void resize(ImVector_ImWchar* self,int new_size,const ImWchar v)
    pass
    
    #Autogenerated for ImVector_ImWchar_size
    cpdef int size(const ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_size_in_bytes
    cpdef int size_in_bytes(const ImVector_ImWchar* self)
    pass
    
    #Autogenerated for ImVector_ImWchar_swap
    cpdef void swap(ImVector_ImWchar* self,ImVector_ImWchar rhs)
    pass
    
    #Autogenerated for ImVector__grow_capacity
    cpdef int _grow_capacity(ImVector* self,int sz)
    pass
    
    #Autogenerated for ImVector_back
    cpdef T* back(ImVector* self)
    cpdef  T* back(ImVector* self)
    pass
    
    #Autogenerated for ImVector_begin
    cpdef T* begin(ImVector* self)
    cpdef  T* begin(ImVector* self)
    pass
    
    #Autogenerated for ImVector_capacity
    cpdef int capacity(ImVector* self)
    pass
    
    #Autogenerated for ImVector_char_ImVector_char
    cpdef  ImVector_char()
    cpdef  ImVector_char(const ImVector_char src)
    pass
    
    #Autogenerated for ImVector_char__grow_capacity
    cpdef int _grow_capacity(const ImVector_char* self,int sz)
    pass
    
    #Autogenerated for ImVector_char_back
    cpdef char* back(ImVector_char* self)
    cpdef char  * back(const ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_begin
    cpdef char* begin(ImVector_char* self)
    cpdef char  * begin(const ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_capacity
    cpdef int capacity(const ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_clear
    cpdef void clear(ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_contains
    cpdef bool contains(const ImVector_char* self,const char v)
    pass
    
    #Autogenerated for ImVector_char_destroy
    
    #{'args': '(ImVector_char* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_char*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_char_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_char_destroy', 'ret': 'void', 'signature': '(ImVector_char*)', 'stname': 'ImVector_char'}
    pass
    
    #Autogenerated for ImVector_char_empty
    cpdef bool empty(const ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_end
    cpdef char* end(ImVector_char* self)
    cpdef char  * end(const ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_erase
    cpdef char* erase(ImVector_char* self,char * it)
    cpdef char* erase(ImVector_char* self,char * it,char * it_last)
    pass
    
    #Autogenerated for ImVector_char_erase_unsorted
    cpdef char* erase_unsorted(ImVector_char* self,char * it)
    pass
    
    #Autogenerated for ImVector_char_front
    cpdef char* front(ImVector_char* self)
    cpdef char  * front(const ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_index_from_ptr
    cpdef int index_from_ptr(const ImVector_char* self,char * it)
    pass
    
    #Autogenerated for ImVector_char_insert
    cpdef char* insert(ImVector_char* self,char * it,const char v)
    pass
    
    #Autogenerated for ImVector_char_pop_back
    cpdef void pop_back(ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_push_back
    cpdef void push_back(ImVector_char* self,const char v)
    pass
    
    #Autogenerated for ImVector_char_push_front
    cpdef void push_front(ImVector_char* self,const char v)
    pass
    
    #Autogenerated for ImVector_char_reserve
    cpdef void reserve(ImVector_char* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_char_resize
    cpdef void resize(ImVector_char* self,int new_size)
    cpdef void resize(ImVector_char* self,int new_size,const char v)
    pass
    
    #Autogenerated for ImVector_char_size
    cpdef int size(const ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_size_in_bytes
    cpdef int size_in_bytes(const ImVector_char* self)
    pass
    
    #Autogenerated for ImVector_char_swap
    cpdef void swap(ImVector_char* self,ImVector_char rhs)
    pass
    
    #Autogenerated for ImVector_clear
    cpdef void clear(ImVector* self)
    pass
    
    #Autogenerated for ImVector_destroy
    
    #{'args': '(ImVector* self)', 'argsT': [{'name': 'self', 'type': 'ImVector*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_destroy', 'ret': 'void', 'signature': '(ImVector*)', 'stname': 'ImVector', 'templated': True}
    pass
    
    #Autogenerated for ImVector_empty
    cpdef bool empty(ImVector* self)
    pass
    
    #Autogenerated for ImVector_end
    cpdef T* end(ImVector* self)
    cpdef  T* end(ImVector* self)
    pass
    
    #Autogenerated for ImVector_erase
    cpdef T* erase(ImVector* self,const T* it)
    cpdef T* erase(ImVector* self,const T* it,const T* it_last)
    pass
    
    #Autogenerated for ImVector_erase_unsorted
    cpdef T* erase_unsorted(ImVector* self,const T* it)
    pass
    
    #Autogenerated for ImVector_float_ImVector_float
    cpdef  ImVector_float()
    cpdef  ImVector_float(const ImVector_float src)
    pass
    
    #Autogenerated for ImVector_float__grow_capacity
    cpdef int _grow_capacity(const ImVector_float* self,int sz)
    pass
    
    #Autogenerated for ImVector_float_back
    cpdef float* back(ImVector_float* self)
    cpdef float  * back(const ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_begin
    cpdef float* begin(ImVector_float* self)
    cpdef float  * begin(const ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_capacity
    cpdef int capacity(const ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_clear
    cpdef void clear(ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_contains
    cpdef bool contains(const ImVector_float* self,const float v)
    pass
    
    #Autogenerated for ImVector_float_destroy
    
    #{'args': '(ImVector_float* self)', 'argsT': [{'name': 'self', 'type': 'ImVector_float*'}], 'call_args': '(self)', 'cimguiname': 'ImVector_float_destroy', 'defaults': [], 'destructor': True, 'ov_cimguiname': 'ImVector_float_destroy', 'ret': 'void', 'signature': '(ImVector_float*)', 'stname': 'ImVector_float'}
    pass
    
    #Autogenerated for ImVector_float_empty
    cpdef bool empty(const ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_end
    cpdef float* end(ImVector_float* self)
    cpdef float  * end(const ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_erase
    cpdef float* erase(ImVector_float* self,float * it)
    cpdef float* erase(ImVector_float* self,float * it,float * it_last)
    pass
    
    #Autogenerated for ImVector_float_erase_unsorted
    cpdef float* erase_unsorted(ImVector_float* self,float * it)
    pass
    
    #Autogenerated for ImVector_float_front
    cpdef float* front(ImVector_float* self)
    cpdef float  * front(const ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_index_from_ptr
    cpdef int index_from_ptr(const ImVector_float* self,float * it)
    pass
    
    #Autogenerated for ImVector_float_insert
    cpdef float* insert(ImVector_float* self,float * it,const float v)
    pass
    
    #Autogenerated for ImVector_float_pop_back
    cpdef void pop_back(ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_push_back
    cpdef void push_back(ImVector_float* self,const float v)
    pass
    
    #Autogenerated for ImVector_float_push_front
    cpdef void push_front(ImVector_float* self,const float v)
    pass
    
    #Autogenerated for ImVector_float_reserve
    cpdef void reserve(ImVector_float* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_float_resize
    cpdef void resize(ImVector_float* self,int new_size)
    cpdef void resize(ImVector_float* self,int new_size,const float v)
    pass
    
    #Autogenerated for ImVector_float_size
    cpdef int size(const ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_size_in_bytes
    cpdef int size_in_bytes(const ImVector_float* self)
    pass
    
    #Autogenerated for ImVector_float_swap
    cpdef void swap(ImVector_float* self,ImVector_float rhs)
    pass
    
    #Autogenerated for ImVector_front
    cpdef T* front(ImVector* self)
    cpdef  T* front(ImVector* self)
    pass
    
    #Autogenerated for ImVector_index_from_ptr
    cpdef int index_from_ptr(ImVector* self,const T* it)
    pass
    
    #Autogenerated for ImVector_insert
    cpdef T* insert(ImVector* self,const T* it,const T v)
    pass
    
    #Autogenerated for ImVector_pop_back
    cpdef void pop_back(ImVector* self)
    pass
    
    #Autogenerated for ImVector_push_back
    cpdef void push_back(ImVector* self,const T v)
    pass
    
    #Autogenerated for ImVector_push_front
    cpdef void push_front(ImVector* self,const T v)
    pass
    
    #Autogenerated for ImVector_reserve
    cpdef void reserve(ImVector* self,int new_capacity)
    pass
    
    #Autogenerated for ImVector_resize
    cpdef void resize(ImVector* self,int new_size)
    cpdef void resize(ImVector* self,int new_size,const T v)
    pass
    
    #Autogenerated for ImVector_size
    cpdef int size(ImVector* self)
    pass
    
    #Autogenerated for ImVector_size_in_bytes
    cpdef int size_in_bytes(ImVector* self)
    pass
    
    #Autogenerated for ImVector_swap
    cpdef void swap(ImVector* self,ImVector rhs)
    pass
    
    #Autogenerated for igAcceptDragDropPayload
    cpdef  ImGuiPayload* AcceptDragDropPayload(const char* type,ImGuiDragDropFlags flags)
    pass
    
    #Autogenerated for igAlignTextToFramePadding
    cpdef void AlignTextToFramePadding()
    pass
    
    #Autogenerated for igArrowButton
    cpdef bool ArrowButton(const char* str_id,ImGuiDir dir)
    pass
    
    #Autogenerated for igBegin
    cpdef bool Begin(const char* name,bool* p_open,ImGuiWindowFlags flags)
    pass
    
    #Autogenerated for igBeginChild
    cpdef bool BeginChild(const char* str_id,const ImVec2 size,bool border,ImGuiWindowFlags flags)
    cpdef bool BeginChild(ImGuiID id,const ImVec2 size,bool border,ImGuiWindowFlags flags)
    pass
    
    #Autogenerated for igBeginChildFrame
    cpdef bool BeginChildFrame(ImGuiID id,const ImVec2 size,ImGuiWindowFlags flags)
    pass
    
    #Autogenerated for igBeginCombo
    cpdef bool BeginCombo(const char* label,const char* preview_value,ImGuiComboFlags flags)
    pass
    
    #Autogenerated for igBeginDragDropSource
    cpdef bool BeginDragDropSource(ImGuiDragDropFlags flags)
    pass
    
    #Autogenerated for igBeginDragDropTarget
    cpdef bool BeginDragDropTarget()
    pass
    
    #Autogenerated for igBeginGroup
    cpdef void BeginGroup()
    pass
    
    #Autogenerated for igBeginMainMenuBar
    cpdef bool BeginMainMenuBar()
    pass
    
    #Autogenerated for igBeginMenu
    cpdef bool BeginMenu(const char* label,bool enabled)
    pass
    
    #Autogenerated for igBeginMenuBar
    cpdef bool BeginMenuBar()
    pass
    
    #Autogenerated for igBeginPopup
    cpdef bool BeginPopup(const char* str_id,ImGuiWindowFlags flags)
    pass
    
    #Autogenerated for igBeginPopupContextItem
    cpdef bool BeginPopupContextItem(const char* str_id,int mouse_button)
    pass
    
    #Autogenerated for igBeginPopupContextVoid
    cpdef bool BeginPopupContextVoid(const char* str_id,int mouse_button)
    pass
    
    #Autogenerated for igBeginPopupContextWindow
    cpdef bool BeginPopupContextWindow(const char* str_id,int mouse_button,bool also_over_items)
    pass
    
    #Autogenerated for igBeginPopupModal
    cpdef bool BeginPopupModal(const char* name,bool* p_open,ImGuiWindowFlags flags)
    pass
    
    #Autogenerated for igBeginTabBar
    cpdef bool BeginTabBar(const char* str_id,ImGuiTabBarFlags flags)
    pass
    
    #Autogenerated for igBeginTabItem
    cpdef bool BeginTabItem(const char* label,bool* p_open,ImGuiTabItemFlags flags)
    pass
    
    #Autogenerated for igBeginTooltip
    cpdef void BeginTooltip()
    pass
    
    #Autogenerated for igBullet
    cpdef void Bullet()
    pass
    
    #Autogenerated for igBulletText
    cpdef void BulletText(const char* fmt,...)
    pass
    
    #Autogenerated for igBulletTextV
    cpdef void BulletTextV(const char* fmt,va_list args)
    pass
    
    #Autogenerated for igButton
    cpdef bool Button(const char* label,const ImVec2 size)
    pass
    
    #Autogenerated for igCalcItemWidth
    cpdef float CalcItemWidth()
    pass
    
    #Autogenerated for igCalcListClipping
    cpdef void CalcListClipping(int items_count,float items_height,int* out_items_display_start,int* out_items_display_end)
    pass
    
    #Autogenerated for igCalcTextSize
    cpdef ImVec2 CalcTextSize(const char* text,const char* text_end,bool hide_text_after_double_hash,float wrap_width)
    cpdef void CalcTextSize(ImVec2 *pOut,const char* text,const char* text_end,bool hide_text_after_double_hash,float wrap_width)
    cpdef ImVec2_Simple CalcTextSize(const char* text,const char* text_end,bool hide_text_after_double_hash,float wrap_width)
    pass
    
    #Autogenerated for igCaptureKeyboardFromApp
    cpdef void CaptureKeyboardFromApp(bool want_capture_keyboard_value)
    pass
    
    #Autogenerated for igCaptureMouseFromApp
    cpdef void CaptureMouseFromApp(bool want_capture_mouse_value)
    pass
    
    #Autogenerated for igCheckbox
    cpdef bool Checkbox(const char* label,bool* v)
    pass
    
    #Autogenerated for igCheckboxFlags
    cpdef bool CheckboxFlags(const char* label,unsigned int* flags,unsigned int flags_value)
    pass
    
    #Autogenerated for igCloseCurrentPopup
    cpdef void CloseCurrentPopup()
    pass
    
    #Autogenerated for igCollapsingHeader
    cpdef bool CollapsingHeader(const char* label,ImGuiTreeNodeFlags flags)
    cpdef bool CollapsingHeader(const char* label,bool* p_open,ImGuiTreeNodeFlags flags)
    pass
    
    #Autogenerated for igColorButton
    cpdef bool ColorButton(const char* desc_id,const ImVec4 col,ImGuiColorEditFlags flags,ImVec2 size)
    pass
    
    #Autogenerated for igColorConvertFloat4ToU32
    cpdef ImU32 ColorConvertFloat4ToU32(const ImVec4 _in)
    pass
    
    #Autogenerated for igColorConvertHSVtoRGB
    cpdef void ColorConvertHSVtoRGB(float h,float s,float v,float out_r,float out_g,float out_b)
    pass
    
    #Autogenerated for igColorConvertRGBtoHSV
    cpdef void ColorConvertRGBtoHSV(float r,float g,float b,float out_h,float out_s,float out_v)
    pass
    
    #Autogenerated for igColorConvertU32ToFloat4
    cpdef ImVec4 ColorConvertU32ToFloat4(ImU32 _in)
    cpdef void ColorConvertU32ToFloat4(ImVec4 *pOut,ImU32 _in)
    cpdef ImVec4_Simple ColorConvertU32ToFloat4(ImU32 _in)
    pass
    
    #Autogenerated for igColorEdit3
    cpdef bool ColorEdit3(const char* label,float col[3],ImGuiColorEditFlags flags)
    pass
    
    #Autogenerated for igColorEdit4
    cpdef bool ColorEdit4(const char* label,float col[4],ImGuiColorEditFlags flags)
    pass
    
    #Autogenerated for igColorPicker3
    cpdef bool ColorPicker3(const char* label,float col[3],ImGuiColorEditFlags flags)
    pass
    
    #Autogenerated for igColorPicker4
    cpdef bool ColorPicker4(const char* label,float col[4],ImGuiColorEditFlags flags,const float* ref_col)
    pass
    
    #Autogenerated for igColumns
    cpdef void Columns(int count,const char* id,bool border)
    pass
    
    #Autogenerated for igCombo
    cpdef bool Combo(const char* label,int* current_item,const char* const items[],int items_count,int popup_max_height_in_items)
    cpdef bool Combo(const char* label,int* current_item,const char* items_separated_by_zeros,int popup_max_height_in_items)
    cpdef bool Combo(const char* label,int* current_item,bool(*items_getter)(void* data,int idx,const char** out_text),void* data,int items_count,int popup_max_height_in_items)
    pass
    
    #Autogenerated for igCreateContext
    cpdef ImGuiContext* CreateContext(ImFontAtlas* shared_font_atlas)
    pass
    
    #Autogenerated for igDebugCheckVersionAndDataLayout
    cpdef bool DebugCheckVersionAndDataLayout(const char* version_str,size_t sz_io,size_t sz_style,size_t sz_vec2,size_t sz_vec4,size_t sz_drawvert,size_t sz_drawidx)
    pass
    
    #Autogenerated for igDestroyContext
    cpdef void DestroyContext(ImGuiContext* ctx)
    pass
    
    #Autogenerated for igDragFloat
    cpdef bool DragFloat(const char* label,float* v,float v_speed,float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igDragFloat2
    cpdef bool DragFloat2(const char* label,float v[2],float v_speed,float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igDragFloat3
    cpdef bool DragFloat3(const char* label,float v[3],float v_speed,float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igDragFloat4
    cpdef bool DragFloat4(const char* label,float v[4],float v_speed,float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igDragFloatRange2
    cpdef bool DragFloatRange2(const char* label,float* v_current_min,float* v_current_max,float v_speed,float v_min,float v_max,const char* format,const char* format_max,float power)
    pass
    
    #Autogenerated for igDragInt
    cpdef bool DragInt(const char* label,int* v,float v_speed,int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igDragInt2
    cpdef bool DragInt2(const char* label,int v[2],float v_speed,int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igDragInt3
    cpdef bool DragInt3(const char* label,int v[3],float v_speed,int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igDragInt4
    cpdef bool DragInt4(const char* label,int v[4],float v_speed,int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igDragIntRange2
    cpdef bool DragIntRange2(const char* label,int* v_current_min,int* v_current_max,float v_speed,int v_min,int v_max,const char* format,const char* format_max)
    pass
    
    #Autogenerated for igDragScalar
    cpdef bool DragScalar(const char* label,ImGuiDataType data_type,void* v,float v_speed,const void* v_min,const void* v_max,const char* format,float power)
    pass
    
    #Autogenerated for igDragScalarN
    cpdef bool DragScalarN(const char* label,ImGuiDataType data_type,void* v,int components,float v_speed,const void* v_min,const void* v_max,const char* format,float power)
    pass
    
    #Autogenerated for igDummy
    cpdef void Dummy(const ImVec2 size)
    pass
    
    #Autogenerated for igEnd
    cpdef void End()
    pass
    
    #Autogenerated for igEndChild
    cpdef void EndChild()
    pass
    
    #Autogenerated for igEndChildFrame
    cpdef void EndChildFrame()
    pass
    
    #Autogenerated for igEndCombo
    cpdef void EndCombo()
    pass
    
    #Autogenerated for igEndDragDropSource
    cpdef void EndDragDropSource()
    pass
    
    #Autogenerated for igEndDragDropTarget
    cpdef void EndDragDropTarget()
    pass
    
    #Autogenerated for igEndFrame
    cpdef void EndFrame()
    pass
    
    #Autogenerated for igEndGroup
    cpdef void EndGroup()
    pass
    
    #Autogenerated for igEndMainMenuBar
    cpdef void EndMainMenuBar()
    pass
    
    #Autogenerated for igEndMenu
    cpdef void EndMenu()
    pass
    
    #Autogenerated for igEndMenuBar
    cpdef void EndMenuBar()
    pass
    
    #Autogenerated for igEndPopup
    cpdef void EndPopup()
    pass
    
    #Autogenerated for igEndTabBar
    cpdef void EndTabBar()
    pass
    
    #Autogenerated for igEndTabItem
    cpdef void EndTabItem()
    pass
    
    #Autogenerated for igEndTooltip
    cpdef void EndTooltip()
    pass
    
    #Autogenerated for igGetBackgroundDrawList
    cpdef ImDrawList* GetBackgroundDrawList()
    pass
    
    #Autogenerated for igGetClipboardText
    cpdef  char* GetClipboardText()
    pass
    
    #Autogenerated for igGetColorU32
    cpdef ImU32 GetColorU32(ImGuiCol idx,float alpha_mul)
    cpdef ImU32 GetColorU32(const ImVec4 col)
    cpdef ImU32 GetColorU32(ImU32 col)
    pass
    
    #Autogenerated for igGetColumnIndex
    cpdef int GetColumnIndex()
    pass
    
    #Autogenerated for igGetColumnOffset
    cpdef float GetColumnOffset(int column_index)
    pass
    
    #Autogenerated for igGetColumnWidth
    cpdef float GetColumnWidth(int column_index)
    pass
    
    #Autogenerated for igGetColumnsCount
    cpdef int GetColumnsCount()
    pass
    
    #Autogenerated for igGetContentRegionAvail
    cpdef ImVec2 GetContentRegionAvail()
    cpdef void GetContentRegionAvail(ImVec2 *pOut)
    cpdef ImVec2_Simple GetContentRegionAvail()
    pass
    
    #Autogenerated for igGetContentRegionMax
    cpdef ImVec2 GetContentRegionMax()
    cpdef void GetContentRegionMax(ImVec2 *pOut)
    cpdef ImVec2_Simple GetContentRegionMax()
    pass
    
    #Autogenerated for igGetCurrentContext
    cpdef ImGuiContext* GetCurrentContext()
    pass
    
    #Autogenerated for igGetCursorPos
    cpdef ImVec2 GetCursorPos()
    cpdef void GetCursorPos(ImVec2 *pOut)
    cpdef ImVec2_Simple GetCursorPos()
    pass
    
    #Autogenerated for igGetCursorPosX
    cpdef float GetCursorPosX()
    pass
    
    #Autogenerated for igGetCursorPosY
    cpdef float GetCursorPosY()
    pass
    
    #Autogenerated for igGetCursorScreenPos
    cpdef ImVec2 GetCursorScreenPos()
    cpdef void GetCursorScreenPos(ImVec2 *pOut)
    cpdef ImVec2_Simple GetCursorScreenPos()
    pass
    
    #Autogenerated for igGetCursorStartPos
    cpdef ImVec2 GetCursorStartPos()
    cpdef void GetCursorStartPos(ImVec2 *pOut)
    cpdef ImVec2_Simple GetCursorStartPos()
    pass
    
    #Autogenerated for igGetDragDropPayload
    cpdef  ImGuiPayload* GetDragDropPayload()
    pass
    
    #Autogenerated for igGetDrawData
    cpdef ImDrawData* GetDrawData()
    pass
    
    #Autogenerated for igGetDrawListSharedData
    cpdef ImDrawListSharedData* GetDrawListSharedData()
    pass
    
    #Autogenerated for igGetFont
    cpdef ImFont* GetFont()
    pass
    
    #Autogenerated for igGetFontSize
    cpdef float GetFontSize()
    pass
    
    #Autogenerated for igGetFontTexUvWhitePixel
    cpdef ImVec2 GetFontTexUvWhitePixel()
    cpdef void GetFontTexUvWhitePixel(ImVec2 *pOut)
    cpdef ImVec2_Simple GetFontTexUvWhitePixel()
    pass
    
    #Autogenerated for igGetForegroundDrawList
    cpdef ImDrawList* GetForegroundDrawList()
    pass
    
    #Autogenerated for igGetFrameCount
    cpdef int GetFrameCount()
    pass
    
    #Autogenerated for igGetFrameHeight
    cpdef float GetFrameHeight()
    pass
    
    #Autogenerated for igGetFrameHeightWithSpacing
    cpdef float GetFrameHeightWithSpacing()
    pass
    
    #Autogenerated for igGetID
    cpdef ImGuiID GetID(const char* str_id)
    cpdef ImGuiID GetID(const char* str_id_begin,const char* str_id_end)
    cpdef ImGuiID GetID(const void* ptr_id)
    pass
    
    #Autogenerated for igGetIO
    cpdef ImGuiIO* GetIO()
    pass
    
    #Autogenerated for igGetItemRectMax
    cpdef ImVec2 GetItemRectMax()
    cpdef void GetItemRectMax(ImVec2 *pOut)
    cpdef ImVec2_Simple GetItemRectMax()
    pass
    
    #Autogenerated for igGetItemRectMin
    cpdef ImVec2 GetItemRectMin()
    cpdef void GetItemRectMin(ImVec2 *pOut)
    cpdef ImVec2_Simple GetItemRectMin()
    pass
    
    #Autogenerated for igGetItemRectSize
    cpdef ImVec2 GetItemRectSize()
    cpdef void GetItemRectSize(ImVec2 *pOut)
    cpdef ImVec2_Simple GetItemRectSize()
    pass
    
    #Autogenerated for igGetKeyIndex
    cpdef int GetKeyIndex(ImGuiKey imgui_key)
    pass
    
    #Autogenerated for igGetKeyPressedAmount
    cpdef int GetKeyPressedAmount(int key_index,float repeat_delay,float rate)
    pass
    
    #Autogenerated for igGetMouseCursor
    cpdef ImGuiMouseCursor GetMouseCursor()
    pass
    
    #Autogenerated for igGetMouseDragDelta
    cpdef ImVec2 GetMouseDragDelta(int button,float lock_threshold)
    cpdef void GetMouseDragDelta(ImVec2 *pOut,int button,float lock_threshold)
    cpdef ImVec2_Simple GetMouseDragDelta(int button,float lock_threshold)
    pass
    
    #Autogenerated for igGetMousePos
    cpdef ImVec2 GetMousePos()
    cpdef void GetMousePos(ImVec2 *pOut)
    cpdef ImVec2_Simple GetMousePos()
    pass
    
    #Autogenerated for igGetMousePosOnOpeningCurrentPopup
    cpdef ImVec2 GetMousePosOnOpeningCurrentPopup()
    cpdef void GetMousePosOnOpeningCurrentPopup(ImVec2 *pOut)
    cpdef ImVec2_Simple GetMousePosOnOpeningCurrentPopup()
    pass
    
    #Autogenerated for igGetScrollMaxX
    cpdef float GetScrollMaxX()
    pass
    
    #Autogenerated for igGetScrollMaxY
    cpdef float GetScrollMaxY()
    pass
    
    #Autogenerated for igGetScrollX
    cpdef float GetScrollX()
    pass
    
    #Autogenerated for igGetScrollY
    cpdef float GetScrollY()
    pass
    
    #Autogenerated for igGetStateStorage
    cpdef ImGuiStorage* GetStateStorage()
    pass
    
    #Autogenerated for igGetStyle
    cpdef ImGuiStyle* GetStyle()
    pass
    
    #Autogenerated for igGetStyleColorName
    cpdef  char* GetStyleColorName(ImGuiCol idx)
    pass
    
    #Autogenerated for igGetStyleColorVec4
    cpdef  ImVec4* GetStyleColorVec4(ImGuiCol idx)
    pass
    
    #Autogenerated for igGetTextLineHeight
    cpdef float GetTextLineHeight()
    pass
    
    #Autogenerated for igGetTextLineHeightWithSpacing
    cpdef float GetTextLineHeightWithSpacing()
    pass
    
    #Autogenerated for igGetTime
    cpdef double GetTime()
    pass
    
    #Autogenerated for igGetTreeNodeToLabelSpacing
    cpdef float GetTreeNodeToLabelSpacing()
    pass
    
    #Autogenerated for igGetVersion
    cpdef  char* GetVersion()
    pass
    
    #Autogenerated for igGetWindowContentRegionMax
    cpdef ImVec2 GetWindowContentRegionMax()
    cpdef void GetWindowContentRegionMax(ImVec2 *pOut)
    cpdef ImVec2_Simple GetWindowContentRegionMax()
    pass
    
    #Autogenerated for igGetWindowContentRegionMin
    cpdef ImVec2 GetWindowContentRegionMin()
    cpdef void GetWindowContentRegionMin(ImVec2 *pOut)
    cpdef ImVec2_Simple GetWindowContentRegionMin()
    pass
    
    #Autogenerated for igGetWindowContentRegionWidth
    cpdef float GetWindowContentRegionWidth()
    pass
    
    #Autogenerated for igGetWindowDrawList
    cpdef ImDrawList* GetWindowDrawList()
    pass
    
    #Autogenerated for igGetWindowHeight
    cpdef float GetWindowHeight()
    pass
    
    #Autogenerated for igGetWindowPos
    cpdef ImVec2 GetWindowPos()
    cpdef void GetWindowPos(ImVec2 *pOut)
    cpdef ImVec2_Simple GetWindowPos()
    pass
    
    #Autogenerated for igGetWindowSize
    cpdef ImVec2 GetWindowSize()
    cpdef void GetWindowSize(ImVec2 *pOut)
    cpdef ImVec2_Simple GetWindowSize()
    pass
    
    #Autogenerated for igGetWindowWidth
    cpdef float GetWindowWidth()
    pass
    
    #Autogenerated for igImage
    cpdef void Image(ImTextureID user_texture_id,const ImVec2 size,const ImVec2 uv0,const ImVec2 uv1,const ImVec4 tint_col,const ImVec4 border_col)
    pass
    
    #Autogenerated for igImageButton
    cpdef bool ImageButton(ImTextureID user_texture_id,const ImVec2 size,const ImVec2 uv0,const ImVec2 uv1,int frame_padding,const ImVec4 bg_col,const ImVec4 tint_col)
    pass
    
    #Autogenerated for igIndent
    cpdef void Indent(float indent_w)
    pass
    
    #Autogenerated for igInputDouble
    cpdef bool InputDouble(const char* label,double* v,double step,double step_fast,const char* format,ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputFloat
    cpdef bool InputFloat(const char* label,float* v,float step,float step_fast,const char* format,ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputFloat2
    cpdef bool InputFloat2(const char* label,float v[2],const char* format,ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputFloat3
    cpdef bool InputFloat3(const char* label,float v[3],const char* format,ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputFloat4
    cpdef bool InputFloat4(const char* label,float v[4],const char* format,ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputInt
    cpdef bool InputInt(const char* label,int* v,int step,int step_fast,ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputInt2
    cpdef bool InputInt2(const char* label,int v[2],ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputInt3
    cpdef bool InputInt3(const char* label,int v[3],ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputInt4
    cpdef bool InputInt4(const char* label,int v[4],ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputScalar
    cpdef bool InputScalar(const char* label,ImGuiDataType data_type,void* v,const void* step,const void* step_fast,const char* format,ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputScalarN
    cpdef bool InputScalarN(const char* label,ImGuiDataType data_type,void* v,int components,const void* step,const void* step_fast,const char* format,ImGuiInputTextFlags flags)
    pass
    
    #Autogenerated for igInputText
    cpdef bool InputText(const char* label,char* buf,size_t buf_size,ImGuiInputTextFlags flags,ImGuiInputTextCallback callback,void* user_data)
    pass
    
    #Autogenerated for igInputTextMultiline
    cpdef bool InputTextMultiline(const char* label,char* buf,size_t buf_size,const ImVec2 size,ImGuiInputTextFlags flags,ImGuiInputTextCallback callback,void* user_data)
    pass
    
    #Autogenerated for igInputTextWithHint
    cpdef bool InputTextWithHint(const char* label,const char* hint,char* buf,size_t buf_size,ImGuiInputTextFlags flags,ImGuiInputTextCallback callback,void* user_data)
    pass
    
    #Autogenerated for igInvisibleButton
    cpdef bool InvisibleButton(const char* str_id,const ImVec2 size)
    pass
    
    #Autogenerated for igIsAnyItemActive
    cpdef bool IsAnyItemActive()
    pass
    
    #Autogenerated for igIsAnyItemFocused
    cpdef bool IsAnyItemFocused()
    pass
    
    #Autogenerated for igIsAnyItemHovered
    cpdef bool IsAnyItemHovered()
    pass
    
    #Autogenerated for igIsAnyMouseDown
    cpdef bool IsAnyMouseDown()
    pass
    
    #Autogenerated for igIsItemActivated
    cpdef bool IsItemActivated()
    pass
    
    #Autogenerated for igIsItemActive
    cpdef bool IsItemActive()
    pass
    
    #Autogenerated for igIsItemClicked
    cpdef bool IsItemClicked(int mouse_button)
    pass
    
    #Autogenerated for igIsItemDeactivated
    cpdef bool IsItemDeactivated()
    pass
    
    #Autogenerated for igIsItemDeactivatedAfterEdit
    cpdef bool IsItemDeactivatedAfterEdit()
    pass
    
    #Autogenerated for igIsItemEdited
    cpdef bool IsItemEdited()
    pass
    
    #Autogenerated for igIsItemFocused
    cpdef bool IsItemFocused()
    pass
    
    #Autogenerated for igIsItemHovered
    cpdef bool IsItemHovered(ImGuiHoveredFlags flags)
    pass
    
    #Autogenerated for igIsItemVisible
    cpdef bool IsItemVisible()
    pass
    
    #Autogenerated for igIsKeyDown
    cpdef bool IsKeyDown(int user_key_index)
    pass
    
    #Autogenerated for igIsKeyPressed
    cpdef bool IsKeyPressed(int user_key_index,bool repeat)
    pass
    
    #Autogenerated for igIsKeyReleased
    cpdef bool IsKeyReleased(int user_key_index)
    pass
    
    #Autogenerated for igIsMouseClicked
    cpdef bool IsMouseClicked(int button,bool repeat)
    pass
    
    #Autogenerated for igIsMouseDoubleClicked
    cpdef bool IsMouseDoubleClicked(int button)
    pass
    
    #Autogenerated for igIsMouseDown
    cpdef bool IsMouseDown(int button)
    pass
    
    #Autogenerated for igIsMouseDragging
    cpdef bool IsMouseDragging(int button,float lock_threshold)
    pass
    
    #Autogenerated for igIsMouseHoveringRect
    cpdef bool IsMouseHoveringRect(const ImVec2 r_min,const ImVec2 r_max,bool clip)
    pass
    
    #Autogenerated for igIsMousePosValid
    cpdef bool IsMousePosValid(const ImVec2* mouse_pos)
    pass
    
    #Autogenerated for igIsMouseReleased
    cpdef bool IsMouseReleased(int button)
    pass
    
    #Autogenerated for igIsPopupOpen
    cpdef bool IsPopupOpen(const char* str_id)
    pass
    
    #Autogenerated for igIsRectVisible
    cpdef bool IsRectVisible(const ImVec2 size)
    cpdef bool IsRectVisible(const ImVec2 rect_min,const ImVec2 rect_max)
    pass
    
    #Autogenerated for igIsWindowAppearing
    cpdef bool IsWindowAppearing()
    pass
    
    #Autogenerated for igIsWindowCollapsed
    cpdef bool IsWindowCollapsed()
    pass
    
    #Autogenerated for igIsWindowFocused
    cpdef bool IsWindowFocused(ImGuiFocusedFlags flags)
    pass
    
    #Autogenerated for igIsWindowHovered
    cpdef bool IsWindowHovered(ImGuiHoveredFlags flags)
    pass
    
    #Autogenerated for igLabelText
    cpdef void LabelText(const char* label,const char* fmt,...)
    pass
    
    #Autogenerated for igLabelTextV
    cpdef void LabelTextV(const char* label,const char* fmt,va_list args)
    pass
    
    #Autogenerated for igListBox
    cpdef bool ListBox(const char* label,int* current_item,const char* const items[],int items_count,int height_in_items)
    cpdef bool ListBox(const char* label,int* current_item,bool(*items_getter)(void* data,int idx,const char** out_text),void* data,int items_count,int height_in_items)
    pass
    
    #Autogenerated for igListBoxFooter
    cpdef void ListBoxFooter()
    pass
    
    #Autogenerated for igListBoxHeader
    cpdef bool ListBoxHeader(const char* label,const ImVec2 size)
    cpdef bool ListBoxHeader(const char* label,int items_count,int height_in_items)
    pass
    
    #Autogenerated for igLoadIniSettingsFromDisk
    cpdef void LoadIniSettingsFromDisk(const char* ini_filename)
    pass
    
    #Autogenerated for igLoadIniSettingsFromMemory
    cpdef void LoadIniSettingsFromMemory(const char* ini_data,size_t ini_size)
    pass
    
    #Autogenerated for igLogButtons
    cpdef void LogButtons()
    pass
    
    #Autogenerated for igLogFinish
    cpdef void LogFinish()
    pass
    
    #Autogenerated for igLogText
    cpdef void LogText(const char* fmt,...)
    pass
    
    #Autogenerated for igLogToClipboard
    cpdef void LogToClipboard(int auto_open_depth)
    pass
    
    #Autogenerated for igLogToFile
    cpdef void LogToFile(int auto_open_depth,const char* filename)
    pass
    
    #Autogenerated for igLogToTTY
    cpdef void LogToTTY(int auto_open_depth)
    pass
    
    #Autogenerated for igMemAlloc
    cpdef void* MemAlloc(size_t size)
    pass
    
    #Autogenerated for igMemFree
    cpdef void MemFree(void* ptr)
    pass
    
    #Autogenerated for igMenuItem
    cpdef bool MenuItem(const char* label,const char* shortcut,bool selected,bool enabled)
    cpdef bool MenuItem(const char* label,const char* shortcut,bool* p_selected,bool enabled)
    pass
    
    #Autogenerated for igNewFrame
    cpdef void NewFrame()
    pass
    
    #Autogenerated for igNewLine
    cpdef void NewLine()
    pass
    
    #Autogenerated for igNextColumn
    cpdef void NextColumn()
    pass
    
    #Autogenerated for igOpenPopup
    cpdef void OpenPopup(const char* str_id)
    pass
    
    #Autogenerated for igOpenPopupOnItemClick
    cpdef bool OpenPopupOnItemClick(const char* str_id,int mouse_button)
    pass
    
    #Autogenerated for igPlotHistogram
    cpdef void PlotHistogram(const char* label,const float* values,int values_count,int values_offset,const char* overlay_text,float scale_min,float scale_max,ImVec2 graph_size,int stride)
    cpdef void PlotHistogram(const char* label,float(*values_getter)(void* data,int idx),void* data,int values_count,int values_offset,const char* overlay_text,float scale_min,float scale_max,ImVec2 graph_size)
    pass
    
    #Autogenerated for igPlotLines
    cpdef void PlotLines(const char* label,const float* values,int values_count,int values_offset,const char* overlay_text,float scale_min,float scale_max,ImVec2 graph_size,int stride)
    cpdef void PlotLines(const char* label,float(*values_getter)(void* data,int idx),void* data,int values_count,int values_offset,const char* overlay_text,float scale_min,float scale_max,ImVec2 graph_size)
    pass
    
    #Autogenerated for igPopAllowKeyboardFocus
    cpdef void PopAllowKeyboardFocus()
    pass
    
    #Autogenerated for igPopButtonRepeat
    cpdef void PopButtonRepeat()
    pass
    
    #Autogenerated for igPopClipRect
    cpdef void PopClipRect()
    pass
    
    #Autogenerated for igPopFont
    cpdef void PopFont()
    pass
    
    #Autogenerated for igPopID
    cpdef void PopID()
    pass
    
    #Autogenerated for igPopItemWidth
    cpdef void PopItemWidth()
    pass
    
    #Autogenerated for igPopStyleColor
    cpdef void PopStyleColor(int count)
    pass
    
    #Autogenerated for igPopStyleVar
    cpdef void PopStyleVar(int count)
    pass
    
    #Autogenerated for igPopTextWrapPos
    cpdef void PopTextWrapPos()
    pass
    
    #Autogenerated for igProgressBar
    cpdef void ProgressBar(float fraction,const ImVec2 size_arg,const char* overlay)
    pass
    
    #Autogenerated for igPushAllowKeyboardFocus
    cpdef void PushAllowKeyboardFocus(bool allow_keyboard_focus)
    pass
    
    #Autogenerated for igPushButtonRepeat
    cpdef void PushButtonRepeat(bool repeat)
    pass
    
    #Autogenerated for igPushClipRect
    cpdef void PushClipRect(const ImVec2 clip_rect_min,const ImVec2 clip_rect_max,bool intersect_with_current_clip_rect)
    pass
    
    #Autogenerated for igPushFont
    cpdef void PushFont(ImFont* font)
    pass
    
    #Autogenerated for igPushID
    cpdef void PushID(const char* str_id)
    cpdef void PushID(const char* str_id_begin,const char* str_id_end)
    cpdef void PushID(const void* ptr_id)
    cpdef void PushID(int int_id)
    pass
    
    #Autogenerated for igPushItemWidth
    cpdef void PushItemWidth(float item_width)
    pass
    
    #Autogenerated for igPushStyleColor
    cpdef void PushStyleColor(ImGuiCol idx,ImU32 col)
    cpdef void PushStyleColor(ImGuiCol idx,const ImVec4 col)
    pass
    
    #Autogenerated for igPushStyleVar
    cpdef void PushStyleVar(ImGuiStyleVar idx,float val)
    cpdef void PushStyleVar(ImGuiStyleVar idx,const ImVec2 val)
    pass
    
    #Autogenerated for igPushTextWrapPos
    cpdef void PushTextWrapPos(float wrap_local_pos_x)
    pass
    
    #Autogenerated for igRadioButton
    cpdef bool RadioButton(const char* label,bool active)
    cpdef bool RadioButton(const char* label,int* v,int v_button)
    pass
    
    #Autogenerated for igRender
    cpdef void Render()
    pass
    
    #Autogenerated for igResetMouseDragDelta
    cpdef void ResetMouseDragDelta(int button)
    pass
    
    #Autogenerated for igSameLine
    cpdef void SameLine(float offset_from_start_x,float spacing)
    pass
    
    #Autogenerated for igSaveIniSettingsToDisk
    cpdef void SaveIniSettingsToDisk(const char* ini_filename)
    pass
    
    #Autogenerated for igSaveIniSettingsToMemory
    cpdef  char* SaveIniSettingsToMemory(size_t* out_ini_size)
    pass
    
    #Autogenerated for igSelectable
    cpdef bool Selectable(const char* label,bool selected,ImGuiSelectableFlags flags,const ImVec2 size)
    cpdef bool Selectable(const char* label,bool* p_selected,ImGuiSelectableFlags flags,const ImVec2 size)
    pass
    
    #Autogenerated for igSeparator
    cpdef void Separator()
    pass
    
    #Autogenerated for igSetAllocatorFunctions
    cpdef void SetAllocatorFunctions(void*(*alloc_func)(size_t sz,void* user_data),void(*free_func)(void* ptr,void* user_data),void* user_data)
    pass
    
    #Autogenerated for igSetClipboardText
    cpdef void SetClipboardText(const char* text)
    pass
    
    #Autogenerated for igSetColorEditOptions
    cpdef void SetColorEditOptions(ImGuiColorEditFlags flags)
    pass
    
    #Autogenerated for igSetColumnOffset
    cpdef void SetColumnOffset(int column_index,float offset_x)
    pass
    
    #Autogenerated for igSetColumnWidth
    cpdef void SetColumnWidth(int column_index,float width)
    pass
    
    #Autogenerated for igSetCurrentContext
    cpdef void SetCurrentContext(ImGuiContext* ctx)
    pass
    
    #Autogenerated for igSetCursorPos
    cpdef void SetCursorPos(const ImVec2 local_pos)
    pass
    
    #Autogenerated for igSetCursorPosX
    cpdef void SetCursorPosX(float local_x)
    pass
    
    #Autogenerated for igSetCursorPosY
    cpdef void SetCursorPosY(float local_y)
    pass
    
    #Autogenerated for igSetCursorScreenPos
    cpdef void SetCursorScreenPos(const ImVec2 pos)
    pass
    
    #Autogenerated for igSetDragDropPayload
    cpdef bool SetDragDropPayload(const char* type,const void* data,size_t sz,ImGuiCond cond)
    pass
    
    #Autogenerated for igSetItemAllowOverlap
    cpdef void SetItemAllowOverlap()
    pass
    
    #Autogenerated for igSetItemDefaultFocus
    cpdef void SetItemDefaultFocus()
    pass
    
    #Autogenerated for igSetKeyboardFocusHere
    cpdef void SetKeyboardFocusHere(int offset)
    pass
    
    #Autogenerated for igSetMouseCursor
    cpdef void SetMouseCursor(ImGuiMouseCursor type)
    pass
    
    #Autogenerated for igSetNextItemOpen
    cpdef void SetNextItemOpen(bool is_open,ImGuiCond cond)
    pass
    
    #Autogenerated for igSetNextItemWidth
    cpdef void SetNextItemWidth(float item_width)
    pass
    
    #Autogenerated for igSetNextWindowBgAlpha
    cpdef void SetNextWindowBgAlpha(float alpha)
    pass
    
    #Autogenerated for igSetNextWindowCollapsed
    cpdef void SetNextWindowCollapsed(bool collapsed,ImGuiCond cond)
    pass
    
    #Autogenerated for igSetNextWindowContentSize
    cpdef void SetNextWindowContentSize(const ImVec2 size)
    pass
    
    #Autogenerated for igSetNextWindowFocus
    cpdef void SetNextWindowFocus()
    pass
    
    #Autogenerated for igSetNextWindowPos
    cpdef void SetNextWindowPos(const ImVec2 pos,ImGuiCond cond,const ImVec2 pivot)
    pass
    
    #Autogenerated for igSetNextWindowSize
    cpdef void SetNextWindowSize(const ImVec2 size,ImGuiCond cond)
    pass
    
    #Autogenerated for igSetNextWindowSizeConstraints
    cpdef void SetNextWindowSizeConstraints(const ImVec2 size_min,const ImVec2 size_max,ImGuiSizeCallback custom_callback,void* custom_callback_data)
    pass
    
    #Autogenerated for igSetScrollFromPosX
    cpdef void SetScrollFromPosX(float local_x,float center_x_ratio)
    pass
    
    #Autogenerated for igSetScrollFromPosY
    cpdef void SetScrollFromPosY(float local_y,float center_y_ratio)
    pass
    
    #Autogenerated for igSetScrollHereX
    cpdef void SetScrollHereX(float center_x_ratio)
    pass
    
    #Autogenerated for igSetScrollHereY
    cpdef void SetScrollHereY(float center_y_ratio)
    pass
    
    #Autogenerated for igSetScrollX
    cpdef void SetScrollX(float scroll_x)
    pass
    
    #Autogenerated for igSetScrollY
    cpdef void SetScrollY(float scroll_y)
    pass
    
    #Autogenerated for igSetStateStorage
    cpdef void SetStateStorage(ImGuiStorage* storage)
    pass
    
    #Autogenerated for igSetTabItemClosed
    cpdef void SetTabItemClosed(const char* tab_or_docked_window_label)
    pass
    
    #Autogenerated for igSetTooltip
    cpdef void SetTooltip(const char* fmt,...)
    pass
    
    #Autogenerated for igSetTooltipV
    cpdef void SetTooltipV(const char* fmt,va_list args)
    pass
    
    #Autogenerated for igSetWindowCollapsed
    cpdef void SetWindowCollapsed(bool collapsed,ImGuiCond cond)
    cpdef void SetWindowCollapsed(const char* name,bool collapsed,ImGuiCond cond)
    pass
    
    #Autogenerated for igSetWindowFocus
    cpdef void SetWindowFocus()
    cpdef void SetWindowFocus(const char* name)
    pass
    
    #Autogenerated for igSetWindowFontScale
    cpdef void SetWindowFontScale(float scale)
    pass
    
    #Autogenerated for igSetWindowPos
    cpdef void SetWindowPos(const ImVec2 pos,ImGuiCond cond)
    cpdef void SetWindowPos(const char* name,const ImVec2 pos,ImGuiCond cond)
    pass
    
    #Autogenerated for igSetWindowSize
    cpdef void SetWindowSize(const ImVec2 size,ImGuiCond cond)
    cpdef void SetWindowSize(const char* name,const ImVec2 size,ImGuiCond cond)
    pass
    
    #Autogenerated for igShowAboutWindow
    cpdef void ShowAboutWindow(bool* p_open)
    pass
    
    #Autogenerated for igShowDemoWindow
    cpdef void ShowDemoWindow(bool* p_open)
    pass
    
    #Autogenerated for igShowFontSelector
    cpdef void ShowFontSelector(const char* label)
    pass
    
    #Autogenerated for igShowMetricsWindow
    cpdef void ShowMetricsWindow(bool* p_open)
    pass
    
    #Autogenerated for igShowStyleEditor
    cpdef void ShowStyleEditor(ImGuiStyle* ref)
    pass
    
    #Autogenerated for igShowStyleSelector
    cpdef bool ShowStyleSelector(const char* label)
    pass
    
    #Autogenerated for igShowUserGuide
    cpdef void ShowUserGuide()
    pass
    
    #Autogenerated for igSliderAngle
    cpdef bool SliderAngle(const char* label,float* v_rad,float v_degrees_min,float v_degrees_max,const char* format)
    pass
    
    #Autogenerated for igSliderFloat
    cpdef bool SliderFloat(const char* label,float* v,float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igSliderFloat2
    cpdef bool SliderFloat2(const char* label,float v[2],float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igSliderFloat3
    cpdef bool SliderFloat3(const char* label,float v[3],float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igSliderFloat4
    cpdef bool SliderFloat4(const char* label,float v[4],float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igSliderInt
    cpdef bool SliderInt(const char* label,int* v,int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igSliderInt2
    cpdef bool SliderInt2(const char* label,int v[2],int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igSliderInt3
    cpdef bool SliderInt3(const char* label,int v[3],int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igSliderInt4
    cpdef bool SliderInt4(const char* label,int v[4],int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igSliderScalar
    cpdef bool SliderScalar(const char* label,ImGuiDataType data_type,void* v,const void* v_min,const void* v_max,const char* format,float power)
    pass
    
    #Autogenerated for igSliderScalarN
    cpdef bool SliderScalarN(const char* label,ImGuiDataType data_type,void* v,int components,const void* v_min,const void* v_max,const char* format,float power)
    pass
    
    #Autogenerated for igSmallButton
    cpdef bool SmallButton(const char* label)
    pass
    
    #Autogenerated for igSpacing
    cpdef void Spacing()
    pass
    
    #Autogenerated for igStyleColorsClassic
    cpdef void StyleColorsClassic(ImGuiStyle* dst)
    pass
    
    #Autogenerated for igStyleColorsDark
    cpdef void StyleColorsDark(ImGuiStyle* dst)
    pass
    
    #Autogenerated for igStyleColorsLight
    cpdef void StyleColorsLight(ImGuiStyle* dst)
    pass
    
    #Autogenerated for igText
    cpdef void Text(const char* fmt,...)
    pass
    
    #Autogenerated for igTextColored
    cpdef void TextColored(const ImVec4 col,const char* fmt,...)
    pass
    
    #Autogenerated for igTextColoredV
    cpdef void TextColoredV(const ImVec4 col,const char* fmt,va_list args)
    pass
    
    #Autogenerated for igTextDisabled
    cpdef void TextDisabled(const char* fmt,...)
    pass
    
    #Autogenerated for igTextDisabledV
    cpdef void TextDisabledV(const char* fmt,va_list args)
    pass
    
    #Autogenerated for igTextUnformatted
    cpdef void TextUnformatted(const char* text,const char* text_end)
    pass
    
    #Autogenerated for igTextV
    cpdef void TextV(const char* fmt,va_list args)
    pass
    
    #Autogenerated for igTextWrapped
    cpdef void TextWrapped(const char* fmt,...)
    pass
    
    #Autogenerated for igTextWrappedV
    cpdef void TextWrappedV(const char* fmt,va_list args)
    pass
    
    #Autogenerated for igTreeNode
    cpdef bool TreeNode(const char* label)
    cpdef bool TreeNode(const char* str_id,const char* fmt,...)
    cpdef bool TreeNode(const void* ptr_id,const char* fmt,...)
    pass
    
    #Autogenerated for igTreeNodeEx
    cpdef bool TreeNodeEx(const char* label,ImGuiTreeNodeFlags flags)
    cpdef bool TreeNodeEx(const char* str_id,ImGuiTreeNodeFlags flags,const char* fmt,...)
    cpdef bool TreeNodeEx(const void* ptr_id,ImGuiTreeNodeFlags flags,const char* fmt,...)
    pass
    
    #Autogenerated for igTreeNodeExV
    cpdef bool TreeNodeExV(const char* str_id,ImGuiTreeNodeFlags flags,const char* fmt,va_list args)
    cpdef bool TreeNodeExV(const void* ptr_id,ImGuiTreeNodeFlags flags,const char* fmt,va_list args)
    pass
    
    #Autogenerated for igTreeNodeV
    cpdef bool TreeNodeV(const char* str_id,const char* fmt,va_list args)
    cpdef bool TreeNodeV(const void* ptr_id,const char* fmt,va_list args)
    pass
    
    #Autogenerated for igTreePop
    cpdef void TreePop()
    pass
    
    #Autogenerated for igTreePush
    cpdef void TreePush(const char* str_id)
    cpdef void TreePush(const void* ptr_id)
    pass
    
    #Autogenerated for igUnindent
    cpdef void Unindent(float indent_w)
    pass
    
    #Autogenerated for igVSliderFloat
    cpdef bool VSliderFloat(const char* label,const ImVec2 size,float* v,float v_min,float v_max,const char* format,float power)
    pass
    
    #Autogenerated for igVSliderInt
    cpdef bool VSliderInt(const char* label,const ImVec2 size,int* v,int v_min,int v_max,const char* format)
    pass
    
    #Autogenerated for igVSliderScalar
    cpdef bool VSliderScalar(const char* label,const ImVec2 size,ImGuiDataType data_type,void* v,const void* v_min,const void* v_max,const char* format,float power)
    pass
    
    #Autogenerated for igValue
    cpdef void Value(const char* prefix,bool b)
    cpdef void Value(const char* prefix,int v)
    cpdef void Value(const char* prefix,unsigned int v)
    cpdef void Value(const char* prefix,float v,const char* float_format)
    pass
    
