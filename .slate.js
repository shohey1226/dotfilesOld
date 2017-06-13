
var launch_and_focus = function (target) {
    return function (win) {
        var apps = [];
        S.eachApp(function (app) { apps.push(app.name()); });
        if (! _.find(apps, function (name) { return name === target; })) {
            win.doOperation(
                S.operation('shell', {
                    command: "/usr/bin/open -a " + target,
                    waithFoeExit: true
                })
            );
        }
        win.doOperation(S.operation('focus', { app: target }));
    };
};
S.bind('q:ctrl', launch_and_focus('iTerm2'));
S.bind('w:ctrl', launch_and_focus('Sublime Text'));
//S.bind('e:ctrl', launch_and_focus('Google Chrome'));
//S.bind('r:ctrl,cmd', launch_and_focus('Safari'));
//S.bind('t:ctrl,cmd', launch_and_focus('Twitter'));
