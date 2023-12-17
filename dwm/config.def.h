/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int gappx     = 6;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Hack Nerd Font:size=14" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#414868";  /* background color */
static const char col_gray2[]       = "#444444";  /* inactive window border color */
static const char col_gray3[]       = "#bbbbbb";  /* font color */
static const char col_gray4[]       = "#414868";  /* current tag and current window font color */
static const char col_cyan[]        = "#80c1ff";  /* top bar second color and active window border color */
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};
static const unsigned int alphas[][3]      = {
    /*               fg      bg        border*/
    [SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

static const char *const autostart[] = {
	"autorandr", "-l", "externalmonitor", NULL,
	"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1", NULL,
	"nitrogen", "--restore", NULL,
	"picom", "-b", NULL,
	"dwmblocks", NULL,
	"clipmenud", NULL,
	"xautolock", "-time", "10", "-locker", "blurlock", NULL,
	"ff-theme-util", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "1:  ", "2:  ", "3:  ", "4:  ", "5:  " };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "St",       NULL,       NULL,       0,            0,           -1 },
	{ "kitty",    NULL,       NULL,       0,            0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.40; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int attachbelow = 1;    /* 1 means attach after the currently active window */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "|M|",      centeredmaster }, /* first entry is default */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ ">M>",      centeredfloatingmaster },
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *roficmd[] =  { "rofi", "-show", "combi", "-combi-modes", "drun#run", "-modes", "combi", NULL };
static const char *powercmd[] = { "rofi", "-show", "power-menu", "-modi", "power-menu:~/.config/rofi/script/rofi-power-menu", NULL };
static const char *calccmd[] =  { "rofi", "-show", "calc", "-modi", "calc", "-no-show-match", "-no-sort", NULL };
static const char *snagcmd[] =  { "flameshot", "gui", "-c", "-p", "/home/alex/Pictures/screenshots", NULL };
static const char *termcmd[] =  { "st", NULL };
static const char *webcmd[] =   { "brave", NULL };
static const char *clipcmd[] =  { "clipmenu", "-p", "'clipboard:'", NULL };
static const char *lockcmd[] =  { "blurlock", NULL };

#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = roficmd } },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = powercmd } },
	{ MODKEY|ShiftMask,             XK_c,      spawn,          {.v = calccmd } },
	{ 0,                            XK_Print,  spawn,          {.v = snagcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_w,      spawn,          {.v = webcmd } },
	{ MODKEY|ShiftMask,             XK_b,      spawn,          {.v = clipcmd } },
	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = lockcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_n,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_i,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_g,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
/*	{ MODKEY,                       XK_u,      setmfact,       {.f = -0.05} }, */
/*	{ MODKEY,                       XK_e,      setmfact,       {.f = +0.05} }, */
	{ MODKEY|ShiftMask,             XK_n,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_i,      movestack,      {.i = -1 } },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_o,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

