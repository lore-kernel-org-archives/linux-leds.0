From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v9 2/2] leds: sc27xx: Add pattern_set/clear interfaces for
 LED controller
Date: Thu, 6 Sep 2018 09:43:10 +0800
Message-ID: <CAMz4ku+JcfwGkSosJMtsK22hU3Ka+mp+X2dK0FagBDRv_fHWsQ@mail.gmail.com>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536131926.git.baolin.wang@linaro.org>
 <b079d9a27390d6589195906606e6bac143bdb95c.1536131926.git.baolin.wang@linaro.org>
 <059de1cc-e964-6976-15c6-bfb3385e1fcf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <059de1cc-e964-6976-15c6-bfb3385e1fcf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 6 September 2018 at 03:14, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> Hi Baolin,
>
> Thanks for the v9.
>
> On 09/05/2018 09:20 AM, Baolin Wang wrote:
>> This patch implements the 'pattern_set'and 'pattern_clear'
>> interfaces to support SC27XX LED breathing mode.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>> ---
>> Changes from v8:
>>  - Optimize the ABI documentation file.
>>
>> Changes from v7:
>>  - Add its own ABI documentation file.
>>
>> Changes from v6:
>>  - None.
>>
>> Changes from v5:
>>  - None.
>>
>> Changes from v4:
>>  - None.
>>
>> Changes from v3:
>>  - None.
>>
>> Changes from v2:
>>  - None.
>>
>> Changes from v1:
>>  - Remove pattern_get interface.
>> ---
>>  .../ABI/testing/sysfs-class-led-driver-sc27xx      |   20 +++++
>>  drivers/leds/leds-sc27xx-bltc.c                    |   93 ++++++++++++++++++++
>>  2 files changed, 113 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
>> new file mode 100644
>> index 0000000..391ca6e
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
>> @@ -0,0 +1,20 @@
>> +What:                /sys/class/leds/<led>/hw_pattern
>> +Date:                September 2018
>> +KernelVersion:       4.20
>> +Description:
>> +             Specify a hardware pattern for the SC27XX LED. For the SC27XX
>> +             LED controller, it only supports 4 stages to make a single
>> +             hardware pattern, which is used to configure the rise time,
>> +             high time, fall time and low time for the breathing mode.
>> +
>> +             For the breathing mode, the SC27XX LED only expects one brightness
>> +             for the high stage. To be compatible with the hardware pattern
>> +             format, we should set brightness as 0 for rise stage, fall
>> +             stage and low stage.
>> +
>> +             Min stage duration: 1
>> +             Max stage duration: 255
>> +             Stage duration step: 125 ms
>
> It seems that min and max stage duration are given in device
> specific levels in contrary to the step which is given in ms.
> Please keep it consistent. If I'm getting it right then duration
> constraints should be given as follows:
>
> Min stage duration: 125 ms
> Max stage duration: 31875 ms

This is not good for users. Since what we set into LED registers is
step counters, and each step is 125 ms. Which means it only support
125ms, 250ms, 375ms, 500ms .... 31875ms.

If user set stage duration to 200ms, what we actually set into LED
registers is 1 step counter (200ms / 125ms = 1), which means the
actual duration is 125ms. That will confuse the user. So I still like
to force user to set the step counter which can show the real
duration.

>> +
>> +             Thus the format of the hardware pattern values should be:
>> +             "0 rise_duration brightness high_duration 0 fall_duration 0 low_duration".
>> diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
>> index 9d9b7aa..bff2f8f 100644
>> --- a/drivers/leds/leds-sc27xx-bltc.c
>> +++ b/drivers/leds/leds-sc27xx-bltc.c
>> @@ -32,8 +32,13 @@
>>  #define SC27XX_DUTY_MASK     GENMASK(15, 0)
>>  #define SC27XX_MOD_MASK              GENMASK(7, 0)
>>
>> +#define SC27XX_CURVE_SHIFT   8
>> +#define SC27XX_CURVE_L_MASK  GENMASK(7, 0)
>> +#define SC27XX_CURVE_H_MASK  GENMASK(15, 8)
>> +
>>  #define SC27XX_LEDS_OFFSET   0x10
>>  #define SC27XX_LEDS_MAX              3
>> +#define SC27XX_LEDS_PATTERN_CNT      4
>>
>>  struct sc27xx_led {
>>       char name[LED_MAX_NAME_SIZE];
>> @@ -122,6 +127,90 @@ static int sc27xx_led_set(struct led_classdev *ldev, enum led_brightness value)
>>       return err;
>>  }
>>
>> +static int sc27xx_led_pattern_clear(struct led_classdev *ldev)
>> +{
>> +     struct sc27xx_led *leds = to_sc27xx_led(ldev);
>> +     struct regmap *regmap = leds->priv->regmap;
>> +     u32 base = sc27xx_led_get_offset(leds);
>> +     u32 ctrl_base = leds->priv->base + SC27XX_LEDS_CTRL;
>> +     u8 ctrl_shift = SC27XX_CTRL_SHIFT * leds->line;
>> +     int err;
>> +
>> +     mutex_lock(&leds->priv->lock);
>> +
>> +     /* Reset the rise, high, fall and low time to zero. */
>> +     regmap_write(regmap, base + SC27XX_LEDS_CURVE0, 0);
>> +     regmap_write(regmap, base + SC27XX_LEDS_CURVE1, 0);
>> +
>> +     err = regmap_update_bits(regmap, ctrl_base,
>> +                     (SC27XX_LED_RUN | SC27XX_LED_TYPE) << ctrl_shift, 0);
>
> What is the LED brightness after executing the above?
> Is it the pattern high stage brightness?
> Or maybe it is LED_OFF?

It is LED_OFF.

>
> We should update LED class device brightness accordingly.
>
> If it is set to LED_OFF then we should update LED class device
> brightness here:
>
> led->ldev.brightness = LED_OFF;

Sure.

>
>> +     mutex_unlock(&leds->priv->lock);
>> +
>> +     return err;
>> +}
>> +
>> +static int sc27xx_led_pattern_set(struct led_classdev *ldev,
>> +                               struct led_pattern *pattern,
>> +                               int len, u32 repeat)
>> +{
>> +     struct sc27xx_led *leds = to_sc27xx_led(ldev);
>> +     u32 base = sc27xx_led_get_offset(leds);
>> +     u32 ctrl_base = leds->priv->base + SC27XX_LEDS_CTRL;
>> +     u8 ctrl_shift = SC27XX_CTRL_SHIFT * leds->line;
>> +     struct regmap *regmap = leds->priv->regmap;
>> +     int err;
>> +
>> +     /*
>> +      * Must contain 4 patterns to configure the rise time, high time, fall
>> +      * time and low time to enable the breathing mode.
>> +      */
>> +     if (len != SC27XX_LEDS_PATTERN_CNT)
>> +             return -EINVAL;
>> +
>> +     mutex_lock(&leds->priv->lock);
>> +
>> +     err = regmap_update_bits(regmap, base + SC27XX_LEDS_CURVE0,
>> +                              SC27XX_CURVE_L_MASK, pattern[0].delta_t);
>> +     if (err)
>> +             goto out;
>> +
>> +     err = regmap_update_bits(regmap, base + SC27XX_LEDS_CURVE1,
>> +                              SC27XX_CURVE_L_MASK, pattern[1].delta_t);
>> +     if (err)
>> +             goto out;
>> +
>> +     err = regmap_update_bits(regmap, base + SC27XX_LEDS_CURVE0,
>> +                              SC27XX_CURVE_H_MASK,
>> +                              pattern[2].delta_t << SC27XX_CURVE_SHIFT);
>> +     if (err)
>> +             goto out;
>> +
>> +
>> +     err = regmap_update_bits(regmap, base + SC27XX_LEDS_CURVE1,
>> +                              SC27XX_CURVE_H_MASK,
>> +                              pattern[3].delta_t << SC27XX_CURVE_SHIFT);
>> +     if (err)
>> +             goto out;
>> +
>> +     err = regmap_update_bits(regmap, base + SC27XX_LEDS_DUTY,
>> +                              SC27XX_DUTY_MASK,
>> +                              (pattern[1].brightness << SC27XX_DUTY_SHIFT) |
>> +                              SC27XX_MOD_MASK);
>
> Continuing the reasoning from my comment to pattern_clear() above -
> if old brightness is not brought back after clearing the pattern,
> then we should set it to high stage brightness here, to keep the
> brightness level reported by the sysfs at least somehow consistent
> with the pattern:
>
> led->ldev.brightness = pattern[1].brightness;

Sure. Will add this. Thanks.

-- 
Baolin Wang
Best Regards
