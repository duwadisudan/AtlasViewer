function probe = viewProbe(probe, mode)

if isempty(mode)
    mode = 'registered';
end

if strcmp(mode,'registered') && ~isempty(probe.optpos_reg)
    optpos = probe.optpos_reg;
    lift = 0;
elseif strcmp(mode,'registered') && isempty(probe.optpos_reg)
    optpos = probe.optpos;
    lift = 0;
elseif strcmp(mode,'unregistered') && ~isempty(probe.optpos)
    optpos = probe.optpos;
    lift = 0;
else
    return;
end

hold on;

pts = prepPtsStructForViewing(optpos, probe.nsrc, 'probenum',[], [probe.handles.textSize, probe.handles.circleSize]);

% Not sure we should do this for probe
if leftRightFlipped(probe)
    axes_order = [2,1,3];
else
    axes_order = [1,2,3];
end

% Save old positions
probe2 = probe;

% Get new probe positions
[probe.handles.labels, probe.handles.circles] = viewPts(pts, probe.center, lift, axes_order);

% Delete old probe graphics handles
resetProbe(probe2);

probe = setOptodeNumbering(probe);
probe = drawMeasChannels(probe);
probe = displaySprings(probe);

hold off

