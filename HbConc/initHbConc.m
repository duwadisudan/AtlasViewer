function hbconc = initHbConc(handles)


hbconc = struct(...
      'name', 'hbconc', ...
      'pathname', '', ...
      'handles',struct(...
          'surf', [], ...
          'hLighting', [], ...          
          'menuItemOverlayHbConc', handles.menuItemOverlayHbConc, ...
          'popupmenuImageDisplay', handles.popupmenuImageDisplay, ...
          'editColormapThreshold', handles.editColormapThreshold, ...
          'textColormapThreshold', handles.textColormapThreshold, ...
          'editSelectChannel', handles.editSelectChannel, ...
          'textSelectChannel', handles.textSelectChannel, ...
          'editCondition', handles.editCondition, ...
          'textCondition', handles.textCondition, ...
          'HbO', [], ...
          'HbR', [], ...
          'axes',[] ...
      ),...
      'config',struct('tRangeMin',[], 'tRangeMax',[]), ...
      'mesh',initMesh(), ...
      'Ch', [], ...
      'iCond',1, ...
      'iHb',1, ...
      'tHRF', [], ...
      'HbConcRaw', [], ...
      'HbO', [], ...
      'HbR', [], ...
      'cmThreshold',[-1e-5,1e-5; -1e-5,1e-5], ...
      ... %'colormin',[.74 .47 .40], ...
      'colormin',[.80, .80, .80], ...
      'menuoffset',0, ...
      'subjData',[], ...
      'iSubj', [], ...
      'center',[], ...
      'orientation', '', ...
      'checkCompatability',[], ...
      'isempty',@isempty_loc, ...
      'prepObjForSave',@prepImgReconForSave ...
);

hbconc = resetHbConc(hbconc);

if exist('handles','var')
    hbconc.handles.axes = handles.axesSurfDisplay;
    if ishandles(handles.hGroupTree)
        idx = get(handles.hGroupTree, 'value');
        if idx==1
            hbconc.iSubj = 0;
        elseif idx > 1
            hbconc.iSubj = idx-1;
        end
    else
        hbconc.iSubj = 1;
    end   
end

hbconc.Ch = str2num(get(hbconc.handles.editSelectChannel,'string'));


% ------------------------------------------------------
function hbconc = prepImgReconForSave(hbconc)

hbconc = rmfield(hbconc, 'iSubj');




% --------------------------------------------------------------
function b = isempty_loc(hbconc)

b = false;
if isempty(hbconc.HbO) & isempty(hbconc.HbR)

    b = true;

end


