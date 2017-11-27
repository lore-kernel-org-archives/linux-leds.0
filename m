From: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Re: [RFC v2 1/2] backlight: pwm_bl: linear interpolation between
 values of brightness-levels
Date: Mon, 27 Nov 2017 12:21:45 +0100
Message-ID: <CAFqH_50VqFJ-p=gRp9md4eHDHM5NpD6zPFfjwPY4LKTh2x6sHQ@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-2-enric.balletbo@collabora.com> <20171120185835.r4ded43i62wnu3jo@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120185835.r4ded43i62wnu3jo@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Rob,

2017-11-20 19:58 GMT+01:00 Rob Herring <robh@kernel.org>:
> On Thu, Nov 16, 2017 at 03:11:50PM +0100, Enric Balletbo i Serra wrote:
>> Setting use-linear-interpolation in the dts will allow you to have linear
>> interpolation between values of brightness-levels.
>>
>> There are now 256 between each of the values of brightness-levels. If
>> something is requested halfway between 2 values, we'll use linear
>> interpolation.
>>
>> This way a high resolution pwm duty cycle can be used without having to
>> list out every possible value in the dts.
>
> I thought we already had a way to do that.
>
>> This system also allows for
>> gamma corrected values (eg: "brightness-levels = <0 2 4 8 16 32>;").
>>
>> Patch based on the Alexandru M Stan work done for ChromeOS kernels.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>  .../bindings/leds/backlight/pwm-backlight.txt      |  2 +
>>  drivers/video/backlight/pwm_bl.c                   | 55 +++++++++++++++++-----
>>  include/linux/pwm_backlight.h                      |  2 +
>>  3 files changed, 47 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>> index 764db86..7c48f20 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>> @@ -17,6 +17,8 @@ Optional properties:
>>                 "pwms" property (see PWM binding[0])
>>    - enable-gpios: contains a single GPIO specifier for the GPIO which enables
>>                    and disables the backlight (see GPIO binding[1])
>> +  - use-linear-interpolation: set this propriety to enable linear interpolation
>> +                              between each of the values of brightness-levels.
>
> Isn't this really just whether you allow values not listed because what
> other kind of interpolation would you do?

Yes, the idea behind this is just allow values not listed.

> Seems like you should just be
> able to query the resolution of the PWM and decide if it can take more
> values than listed.
>

Without using a new DT propriety and let decide the driver when use
intepolation and when not? Shouldn't this break current behavior then?
You can have a high resolution PWM but I'm not sure if you want allow
always more values than listed.

Regards,
 Enric


> Rob
