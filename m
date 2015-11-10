From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RESEND 15/16] leds: add LM3633 driver
Date: Tue, 10 Nov 2015 14:44:51 +0100
Message-ID: <5641F4D3.7000800@samsung.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-16-git-send-email-milo.kim@ti.com>
 <5638DD99.9070502@samsung.com> <56419F0C.90009@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:8194 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752825AbbKJNo4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 10 Nov 2015 08:44:56 -0500
In-reply-to: <56419F0C.90009@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On 11/10/2015 08:38 AM, Kim, Milo wrote:
> Hi Jacek,
>
> On 11/4/2015 1:15 AM, Jacek Anaszewski wrote:
>> Hi Milo,
>>
>> Thanks for the patch. Please find my comments in the code.
>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-lm3633
>>> b/Documentation/ABI/testing/sysfs-class-led-lm3633
>>> new file mode 100644
>>> index 0000000..c1d8759
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-class-led-lm3633
>>> @@ -0,0 +1,60 @@
>>> +LM3633 LED driver generates programmable pattern via the sysfs.
>>> +
>>> +LED Pattern Generator Structure
>>> +
>>> +                            (3)
>>> +  (a) --------------->  ___________
>>> +                       /           \
>>> +                  (2) /             \ (4)
>>> +  (b) ----> _________/               \_________  ...
>>> +               (1)                       (5)
>>> +
>>> +                     |<-----   period   -----> |
>>> +
>>> +What:        /sys/class/leds/<led>/pattern_times
>>
>> "time" noun is uncountable.
>>
>>> +Date:        Oct 2015
>>> +KernelVersion:    4.3
>>
>> These properties certainly will not appear in 4.3.
>
> Oops! 4.4 gonna be OK?

We have currently 4.4 merge window, so the most plausible is 4.5.

>>
>>> +Contact:    Milo Kim <milo.kim@ti.com>
>>> +Description:    read/write
>>> +                Set pattern time dimension. There are five arguments.
>>> +                  (1) startup delay
>>> +                  (2) rising dimming time
>>> +                  (3) how much time stays at high level
>>> +                  (4) falling dimming time
>>> +                  (5) how much time stays at low level
>>> +                Ranges are
>>> +                  (1), (3), (5): 0 ~ 10000. Unit is millisecond.
>>> +                  (2), (4): 0 ~ 16000. Unit is millisecond.
>>> +
>>> +                Example:
>>> +                No delay, rising 200ms, high 300ms, falling 100ms,
>>> low 400ms.
>>> +                echo "0 200 300 100 400" >
>>> /sys/class/leds/<led>/pattern_times
>>> +
>>> +                cat /sys/class/leds/<led>/pattern_times
>>> +                delay: 0, rise: 200, high: 300, fall: 100, low: 400
>>
>> Generally a sysfs attribute should represent a single value.
>> There are cases where the attribute comprises a list of space separated
>> values, but certainly colons and commas adds to much noise, and are
>> cumbersome to parse. I'd opt for creating a separate sysfs attribute
>> for each of the above 5 properties.
>
> Got it, thanks!
>
>>
>>> +What:        /sys/class/leds/<led>/pattern_levels
>>> +Date:        Oct 2015
>>> +KernelVersion:    4.3
>>> +Contact:    Milo Kim <milo.kim@ti.com>
>>> +Description:    read/write
>>> +                Set pattern level(brightness). There are two arguments.
>>> +                  (a) Low brightness level
>>> +                  (b) High brightness level
>>> +                Ranges are from 0 to 255.
>>> +
>>> +                Example:
>>> +                Low level is 0, high level is 255.
>>> +                echo "0 255" > /sys/class/leds/<led>/pattern_levels
>>
>> I'd go also for two separate attributes. E.g. pattern_brightness_lo and
>> pattern_brightness_hi, or maybe you'll have better idea.
>
> OK.
>
>>
>>> +                cat /sys/class/leds/<led>/pattern_levels
>>> +                low brightness: 0, high brightness: 255
>>> +
>>> +What:        /sys/class/leds/<led>/run_pattern
>>> +Date:        Oct 2015
>>> +KernelVersion:    4.3
>>> +Contact:    Milo Kim <milo.kim@ti.com>
>>> +Description:    write only
>>> +                After 'pattern_times' and 'pattern_levels' are updated,
>>> +                run the pattern by writing 1 to 'run_pattern'.
>>> +                To stop running pattern, writes 0 to 'run_pattern'.
>>
>> I wonder how registering an in-driver trigger would work. It would
>> allow for hiding above pattern attributes when the trigger is inactive,
>> and thus making the sysfs interface more transparent. You could avoid
>> the need for run_pattern attribute, as setting the trigger would itself
>> activate the pattern, and setting brightness to 0 would turn it off.
>
> I like this idea, let me try to fix it.
>
>>> +/**
>>> + * struct ti_lmu_led
>>> + *
>>> + * @chip:        Pointer to parent LED device
>>> + * @bank_id:        LED bank ID
>>> + * @cdev:        LED subsystem device structure
>>> + * @name:        LED channel name
>>> + * @led_string:        LED string configuration.
>>> + *            Bit mask is set on parsing DT.
>>> + * @imax:        [Optional] Max current index.
>>> + *            It's result of ti_lmu_get_current_code().
>>
>> Why is this optional?
>
> You're correct, this is not optional. DT property is optional.
>
>>> +static ssize_t lm3633_led_store_pattern_levels(struct device *dev,
>>> +                           struct device_attribute *attr,
>>> +                           const char *buf, size_t len)
>>> +{
>>> +    struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
>>> +    struct ti_lmu_led_chip *chip = lmu_led->chip;
>>> +    unsigned int low, high;
>>> +    u8 reg, offset, val;
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * Sequence
>>> +     *
>>> +     * 1) Read pattern level data
>>> +     * 2) Disable a bank before programming a pattern
>>> +     * 3) Update LOW BRIGHTNESS register
>>> +     * 4) Update HIGH BRIGHTNESS register
>>> +     *
>>> +     * Level register addresses have offset number based on the LED
>>> bank.
>>> +     */
>>> +
>>> +    ret = sscanf(buf, "%u %u", &low, &high);
>>> +    if (ret != 2)
>>> +        return -EINVAL;
>>> +
>>> +    low = min_t(unsigned int, low, LM3633_LED_MAX_BRIGHTNESS);
>>
>> Why don't you take into account the value defined by led-max-microamp
>> DT property here?
>
> 'low' and 'high' are brightness value. The range is from 0 to 255. It is
> mostly related with LED sysfs - /sys/class/led/<led>/brightness.
> On the other hand, led-max-microamp is current limit. It is from 5mA to
> 30mA. It's different configuration in this device.

Doesn't the current has direct influence on the LED brightness?
Are there other means for adjusting brightness than current setting?
I see in your enum ti_lmu_max_current, that there are 26 possible
current levels. I think that they should reflect 26 possible
brightness levels, so max_brightness can be at most 26.

led-max-microamp was designed for defining max brightness limit.
It should be converted into max brightness level in the driver and
assigned to max_brightness property of struct led_classdev.
This attribute overrides legacy 0-255 brightness scale.

>>> +static void lm3633_led_work(struct work_struct *work)
>>> +{
>>> +    struct ti_lmu_led *lmu_led = container_of(work, struct ti_lmu_led,
>>> +                          work);
>>> +    struct ti_lmu_led_chip *chip = lmu_led->chip;
>>> +    int ret;
>>> +
>>> +    mutex_lock(&chip->lock);
>>> +
>>> +    ret = ti_lmu_write_byte(chip->lmu,
>>> +                LM3633_REG_BRT_LVLED_BASE + lmu_led->bank_id,
>>> +                lmu_led->brightness);
>>> +    if (ret) {
>>> +        mutex_unlock(&chip->lock);
>>> +        return;
>>> +    }
>>> +
>>> +    if (lmu_led->brightness == 0)
>>> +        lm3633_led_disable_bank(lmu_led);
>>> +    else
>>> +        lm3633_led_enable_bank(lmu_led);
>>
>> Is it possible to control a brightness of a whole bank only,
>> and not individual LEDs?
>
> No, LM3633 has internal control banks. Let me assume that two LED groups
> are assigned below.
>      LED 1, 2, 3 - RGB
>      LED 4 - status
> Two control banks should be allocated. The bank should be controlled
> separately. If we try to enable/disabe all banks, then 6 output LED
> channels are controlled at the same time.

OK, I'll wait for the next version of the patch to discuss this in
detail.

>>> +static int lm3633_led_init(struct ti_lmu_led *lmu_led, int bank_id)
>>> +{
>>> +    struct device *dev = lmu_led->chip->dev;
>>> +    char name[12];
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * Sequence
>>> +     *
>>> +     * 1) Configure LED bank which is used for brightness control
>>> +     * 2) Set max current for each output channel
>>> +     * 3) Add LED device
>>> +     */
>>> +
>>> +    ret = lm3633_led_config_bank(lmu_led);
>>> +    if (ret) {
>>> +        dev_err(dev, "Output bank register err: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = lm3633_led_set_max_current(lmu_led);
>>> +    if (ret) {
>>> +        dev_err(dev, "Set max current err: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    lmu_led->cdev.max_brightness = LM3633_LED_MAX_BRIGHTNESS;
>>
>> The value assigned here should be determined by led-max-microamp
>> DT property.
>
> Ditto. Current limit is different configuration from brightness value.

It should be converted to the corresponding brightness level. See other
LED class drivers using led-max-microamp property (e.g. leds-aat1290).

-- 
Best Regards,
Jacek Anaszewski
