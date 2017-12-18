From: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Re: [RFC v2 1/2] backlight: pwm_bl: linear interpolation between
 values of brightness-levels
Date: Mon, 18 Dec 2017 10:47:24 +0100
Message-ID: <CAFqH_51O5zqDUJiRp5nktM-ks=URkgCwMSy9fhbZG6D0qarJrg@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-2-enric.balletbo@collabora.com> <20171215144052.3b62gd3bkiqtuvk7@oak.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215144052.3b62gd3bkiqtuvk7@oak.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Daniel,

2017-12-15 15:40 GMT+01:00 Daniel Thompson <daniel.thompson@linaro.org>:
> On Thu, Nov 16, 2017 at 03:11:50PM +0100, Enric Balletbo i Serra wrote:
>>
>> Setting use-linear-interpolation in the dts will allow you to have linear
>> interpolation between values of brightness-levels.
>>
>> There are now 256 between each of the values of brightness-levels. If
>> something is requested halfway between 2 values, we'll use linear
>> interpolation.
>
> Why 256?

To be honest there isn't a strong reason, I thought that 256 was a
good value because is the minimum number of steps possible (8 bits
pwm). But yeah, guess the discussion is more if this value should be
calculated, or specified in the the DT more than the value itself.

>>
>> This way a high resolution pwm duty cycle can be used without having to
>> list out every possible value in the dts. This system also allows for
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
> Deciding whether or not this deployment of interpolation is a property
> of the hardware is a finely balanced judgement. On the whole I conclude
> that since the lookup table is a property of the hardware so too is the
> deployment of interpolation.
>
> Following up on the "why 256?" comment. IMHO either the number of
> interpolated steps should be calculated from the underlying PWM
> resolution or it could simply be specified in the DT (e.g. replace
> use-linear-interpolation with num-interpolated-steps).
>

Personally I like the idea to have the possibility to specify the
number of interpolated steps in the DT, I think that will be more
flexible for the user. If it's ok let me send a first version using
num-interpolated-steps, and continue the discussion about if makes
sense to have that in the DT or not.

>
>>  [0]: Documentation/devicetree/bindings/pwm/pwm.txt
>>  [1]: Documentation/devicetree/bindings/gpio/gpio.txt
>> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
>> index 9bd1768..59b1bfb 100644
>> --- a/drivers/video/backlight/pwm_bl.c
>> +++ b/drivers/video/backlight/pwm_bl.c
>> @@ -24,6 +24,8 @@
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/slab.h>
>>
>> +#define NSTEPS       256
>> +
>>  struct pwm_bl_data {
>>       struct pwm_device       *pwm;
>>       struct device           *dev;
>> @@ -35,6 +37,7 @@ struct pwm_bl_data {
>>       struct gpio_desc        *enable_gpio;
>>       unsigned int            scale;
>>       bool                    legacy;
>> +     bool                    piecewise;
>>       int                     (*notify)(struct device *,
>>                                         int brightness);
>>       void                    (*notify_after)(struct device *,
>> @@ -76,17 +79,36 @@ static void pwm_backlight_power_off(struct pwm_bl_data *pb)
>>       pb->enabled = false;
>>  }
>>
>> -static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
>> +static int scale(struct pwm_bl_data *pb, int x)
>>  {
>>       unsigned int lth = pb->lth_brightness;
>> +
>> +     return (x * (pb->period - lth) / pb->scale) + lth;
>> +}
>> +
>> +static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
>> +{
>> +     int coarse = brightness / NSTEPS;
>> +     int fine = brightness % NSTEPS;
>>       int duty_cycle;
>>
>> -     if (pb->levels)
>> -             duty_cycle = pb->levels[brightness];
>> -     else
>> -             duty_cycle = brightness;
>> +     if (pb->levels) {
>> +             if (pb->piecewise) {
>> +                     duty_cycle = scale(pb, pb->levels[coarse]);
>> +                     if (fine > 0)
>> +                             duty_cycle += (scale(pb, pb->levels[coarse + 1])
>> +                                            - scale(pb, pb->levels[coarse]))
>> +                                            * fine / NSTEPS;
>> +                     dev_dbg(pb->dev, "brightness=%d coarse=%d fine=%d\n",
>> +                             brightness, coarse, fine);
>> +             } else {
>> +                     duty_cycle = scale(pb, pb->levels[brightness]);
>> +             }
>> +     } else {
>> +             duty_cycle = scale(pb, brightness);
>> +     }
>>
>> -     return (duty_cycle * (pb->period - lth) / pb->scale) + lth;
>> +     return duty_cycle;
>>  }
>>
>>  static int pwm_backlight_update_status(struct backlight_device *bl)
>> @@ -149,11 +171,11 @@ static int pwm_backlight_parse_dt(struct device *dev,
>>       if (!prop)
>>               return -EINVAL;
>>
>> -     data->max_brightness = length / sizeof(u32);
>> +     data->levels_count = length / sizeof(u32);
>>
>>       /* read brightness levels from DT property */
>> -     if (data->max_brightness > 0) {
>> -             size_t size = sizeof(*data->levels) * data->max_brightness;
>> +     if (data->levels_count > 0) {
>> +             size_t size = sizeof(*data->levels) * data->levels_count;
>>
>>               data->levels = devm_kzalloc(dev, size, GFP_KERNEL);
>>               if (!data->levels)
>> @@ -161,7 +183,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
>>
>>               ret = of_property_read_u32_array(node, "brightness-levels",
>>                                                data->levels,
>> -                                              data->max_brightness);
>> +                                              data->levels_count);
>>               if (ret < 0)
>>                       return ret;
>>
>> @@ -170,10 +192,18 @@ static int pwm_backlight_parse_dt(struct device *dev,
>>               if (ret < 0)
>>                       return ret;
>>
>> +             data->piecewise = of_property_read_bool(node,
>> +                                                 "use-linear-interpolation");
>> +
>>               data->dft_brightness = value;
>> -             data->max_brightness--;
>> +             data->levels_count--;
>>       }
>>
>> +     if (data->piecewise)
>> +             data->max_brightness = data->levels_count * NSTEPS;
>> +     else
>> +             data->max_brightness = data->levels_count;
>
> I think we lost a -1 here?
>

Good catch, I think so.

Regards,
 Enric

>
> Daniel.
