From: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RESEND 15/16] leds: add LM3633 driver
Date: Wed, 11 Nov 2015 11:16:01 +0900
Message-ID: <5642A4E1.8060000@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-16-git-send-email-milo.kim@ti.com>
 <5638DD99.9070502@samsung.com> <56419F0C.90009@ti.com>
 <5641F4D3.7000800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5641F4D3.7000800-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 11/10/2015 10:44 PM, Jacek Anaszewski wrote:
>>>> +static ssize_t lm3633_led_store_pattern_levels(struct device *dev,
>>>> >>>+                           struct device_attribute *attr,
>>>> >>>+                           const char *buf, size_t len)
>>>> >>>+{
>>>> >>>+    struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
>>>> >>>+    struct ti_lmu_led_chip *chip = lmu_led->chip;
>>>> >>>+    unsigned int low, high;
>>>> >>>+    u8 reg, offset, val;
>>>> >>>+    int ret;
>>>> >>>+
>>>> >>>+    /*
>>>> >>>+     * Sequence
>>>> >>>+     *
>>>> >>>+     * 1) Read pattern level data
>>>> >>>+     * 2) Disable a bank before programming a pattern
>>>> >>>+     * 3) Update LOW BRIGHTNESS register
>>>> >>>+     * 4) Update HIGH BRIGHTNESS register
>>>> >>>+     *
>>>> >>>+     * Level register addresses have offset number based on the LED
>>>> >>>bank.
>>>> >>>+     */
>>>> >>>+
>>>> >>>+    ret = sscanf(buf, "%u %u", &low, &high);
>>>> >>>+    if (ret != 2)
>>>> >>>+        return -EINVAL;
>>>> >>>+
>>>> >>>+    low = min_t(unsigned int, low, LM3633_LED_MAX_BRIGHTNESS);
>>> >>
>>> >>Why don't you take into account the value defined by led-max-microamp
>>> >>DT property here?
>> >
>> >'low' and 'high' are brightness value. The range is from 0 to 255. It is
>> >mostly related with LED sysfs -/sys/class/led/<led>/brightness.
>> >On the other hand, led-max-microamp is current limit. It is from 5mA to
>> >30mA. It's different configuration in this device.
> Doesn't the current has direct influence on the LED brightness?
> Are there other means for adjusting brightness than current setting?
> I see in your enum ti_lmu_max_current, that there are 26 possible
> current levels. I think that they should reflect 26 possible
> brightness levels, so max_brightness can be at most 26.

Let me describe LM3633 in more details. I'd like to have your opinion 
about led-max-microamp and max_brightness usages. Datasheet would be 
better to figure out characteristics.

	http://www.ti.com/lit/ds/symlink/lm3633.pdf

Max current level is not same as brightness level in LM3633.
LM3633 device has two parameters for output brightness control.
One is brightness code(base register address is 0x44). The other is 
current limit(base register address is 0x22). It also provides hardware 
protection like excessive current.

	0 <= brightness_code <= 0xff
	0 <= current_limit_code <= 0x1f, it means
	5mA <= current_limit <= 30mA.

LM3633 device calculates the output current below.

	(1) Linear brightness mode
	Iout = current_limit * brightness_code/255

	(2) Exponential brightness mode
	Iout = current_limit * 0.85 ^ (44 - (brightness_code + 1)/5.18)

So output current(Iout) can not be in excess of current_limit.

>
> led-max-microamp was designed for defining max brightness limit.
> It should be converted into max brightness level in the driver and
> assigned to max_brightness property of struct led_classdev.
> This attribute overrides legacy 0-255 brightness scale.
>

It could be applied when brightness is determined by only one parameter 
- current level. Flash/torch device would be a good example. In this 
device, current setting is directly scaled to the output brightness.

However, LM3633 has two parameters for the brightness control - current 
limit and brightness level. Max current setting is one of brightness 
control parameters. In this patch, 'led-max-microamp' from DT is 
converted to 'current_limit_code'. Then, this value is written once when 
the driver is initialized. On the other hand, 'brightness_code' can be 
changed at run time. And 'max_brightness' of led_classdev is set to max 
brightness register value, 0xff.

It sounds 'led-max-microamp' property might not be a general usage in 
LM3633. Do you have some idea?

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
