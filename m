From: Brian Norris <briannorris@google.com>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Tue, 11 Jun 2019 09:55:30 -0700
Message-ID: <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com> <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain> <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611104913.egsbwcedshjdy3m5@holly.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Pavel Machek <pavel@ucw.cz>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, kernel@collabora.com
List-Id: linux-leds@vger.kernel.org

On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> This is a long standing flaw in the backlight interfaces. AFAIK generic
> userspaces end up with a (flawed) heuristic.

Bingo! Would be nice if we could start to fix this long-standing flaw.

> Basically devices with a narrow range of choices can be assumed to be
> logarithmic

That's (almost, see below) exactly what we have.

(And this is what Matthias is fighting against, now that we're
implementing both "large number of data points" and "pre-curved" at
the same time. We will have to either adapt the heuristic, or else
adapt our device trees to fit the heuristic.)

> Systems are coming along that allow us to animate the change of
> brightness (part of the reason for interpolated tables is to
> permit smooth animation rather than because the user explicitly wants
> to set the brightness to exactly 1117).

Chrome OS has done this for a long time. So "coming along" is a bit late ;)

Also, I believe Chrome OS will do animation/smoothing for all tables
(small or large) where it can: even for the small tables.

> These systems are often
> logarithmic but with a wide range of values.

NB: Chrome OS happens to use a polynomial formula (exponent = 2 or
0.5, depending on how you look at it), not logarithmic. You can see it
in all its (non)glory here:

https://chromium.googlesource.com/chromiumos/platform2/+/ee015853b227cf265491bd80ccf096b188490529/power_manager/powerd/policy/internal_backlight_controller.cc#451

Regards,
Brian
