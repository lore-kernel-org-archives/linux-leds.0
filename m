From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Tue, 11 Jun 2019 15:30:19 -0700
Message-ID: <20190611223019.GH137143@google.com>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
 <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@google.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Pavel Machek <pavel@ucw.cz>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, kernel@collabora.com
List-Id: linux-leds@vger.kernel.org

On Tue, Jun 11, 2019 at 09:55:30AM -0700, Brian Norris wrote:
> On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > This is a long standing flaw in the backlight interfaces. AFAIK generic
> > userspaces end up with a (flawed) heuristic.
> 
> Bingo! Would be nice if we could start to fix this long-standing flaw.

Agreed!

How could a fix look like, a sysfs attribute? Would a boolean value
like 'logarithmic_scale' or 'linear_scale' be enough or could more
granularity be needed?

The new attribute could be optional (it only exists if explicitly
specified by the driver) or be set to a default based on a heuristic
if not specified and be 'fixed' on a case by case basis. The latter
might violate "don't break userspace" though, so I'm not sure it's a
good idea.
