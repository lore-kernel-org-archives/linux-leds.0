From: Doug Anderson <dianders@google.com>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Mon, 18 Dec 2017 08:46:09 -0800
Message-ID: <CAD=FV=VEakDGqfEkOZbuiq=FvUw46=6u9rTOgTk5FyJ9_2Rh4A@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com> <20171215145120.2d2o33tqlechp45h@oak.lan>
 <CAFqH_50Jqs5_5n7D019_ZxvQD1FPCZAYhaLunNm6qzj_cH3tiw@mail.gmail.com> <20171218133138.smvnucfm44bgmdpw@oak.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171218133138.smvnucfm44bgmdpw@oak.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi,

On Mon, Dec 18, 2017 at 5:31 AM, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> I think two different values on the userspace side should always map to
> different values on the kernel side.

This is what I thought originally, but I believe I've convinced myself
that this contradicts other goals and therefore needs to be relaxed.
Specifically:

Goal #1: A linear adjustment in the number exposed to userspace should
result in a linear increase in human perceived brightness.

Goal #2: Don't needlessly throw away precision available to the
hardware.  For instance, if the hardware only supports 64, 128 or 256
levels, it seems like a worthy goal to make sure that userspace can
access each of these brightness levels.


So if we accept that #1 and #2 are goals, the only solution is to
expose a larger "virtual" space and have more than one user-exposed
value map to the same actual brightness.  As a very simple example,
let's say we have a backlight that allows 8 levels:

0 = black
1 = 20% user brightness
2 = 40% user brightness
3 = 60% user brightness
4 = 75% user brightness
5 = 85% user brightness
6 = 90% user brightness
7 = 95% user brightness
8 = 100% user brightness

What should we do here?  We certainly couldn't expose 8 levels to the
user since that would be very non-linear.  What about if we exposed 6
levels?  We could do:

0%, 20%, 40%, 60%, 85%, 100%

That's mostly linear, but the 85% is a little wrong.  We've also
thrown away the ability for the user to access 90% and 95%, which
seems non-ideal.  IMHO better in this case is is to expose 101 values
to userspace (including 0 and 100) and accept the fact that when the
user specifies 10% and 11% that it won't change anything in the
hardware.

Now, I suppose that throwing away a few values if a PWM has 65536
levels is maybe not the end of the world, but I guess it also depends
a lot on which levels you're throwing out.  If we have this:

0 = black
1 = 5% user brightness
2 = 10% user brightness
65534 = 99.99% user brightness
65536 = 100% user brightness

If we kept things linear (and didn't duplicate) in this case, we'd
only expose 21 different level.  0, 5%, 10%, ..., 95%, 100%.  IMHO
it's better to duplicate.


Once we've accepted duplication, I'd say it's easier to just pick a
number of levels (4096?) and expose that to the user.  If we wanted to
be more friendly to the user, we could perhaps somehow expose the
actual value, too.  For instance, in the above example with 8 levels
if the user set the brightness to "11", we could somehow expose to
userspace that the brightness actually became "20".


> This should make it possible
> to calculate the maximal number of steps by scaling up the table to the
> PWM resolution and then scanning for the smallest interval between
> table steps.
>
> Once we have a maximal value we could either use it directly or we
> might want to push it through min(calculated_max, 1024), on the
> assumption that even for animated changes to backlight level that
> 1024 is a sensible limit[1]
>
>
> [1] I think it is... I'd be interested to know of Doug A. shares this
>     view..

I'm not not an expert at all, I just pretend sometimes (though usually
I don't even pretend and just bask in my ignorance).  Somehow it
sticks in my mind that 4096 would be a good value, but I have no real
evidence to back that up.

...but, that being said, let's see if I can come up with an excuse for
4096.  My overall goal is that you want to be able to adjust the
brightness without the user noticing each step.  Users can definitely
notice a step at 256 levels since that's widely quoted as roughly the
number of levels that the human can perceive.  I'd double it to be
sure (hey, people pay for 48-bit color, don't they?), so let's say
that a user could perceive 512 steps.  My initial thought is that
you'd want to animate, maybe 8 steps, between each perceivable point,
which would get to 4096.  ...but now that I say it, it does seem like
technically you could get away with moving 1/1024, waiting, then the
moving another 1/1024.  In theory, the user shouldn't notice each step
and it should be just as smooth as making 8 steps.

...so I guess I've convinced myself that 1024 should be enough.  If I
were designing it I'd probably still pick 4096 anyway just because I
see no downsides and I could sorta believe that somehow my argument is
wrong, but I won't yell if you pick 1024.
