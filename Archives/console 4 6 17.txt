function handles = console(message,handles)
% Outputs text to the console textboxes on the GameTool GUI and shifts old
% messages upward.

% message = string to be displayed

handles.console10.String = handles.console9.String;
handles.console9.String = handles.console8.String;
handles.console8.String = handles.console7.String;
handles.console7.String = handles.console6.String;
handles.console6.String = handles.console5.String;
handles.console5.String = handles.console4.String;
handles.console4.String = handles.console3.String;
handles.console3.String = handles.console2.String;
handles.console2.String = handles.console1.String;
handles.console1.String = message;