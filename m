From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 8/9] leds: add LM3633 driver
Date: Sat, 28 Nov 2015 09:28:40 +0100
Message-ID: <565965B8.9020507@gmail.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com> <1448521025-2796-9-git-send-email-milo.kim@ti.com> <56583C37.1050307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56583C37.1050307-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 11/27/2015 12:19 PM, Jacek Anaszewski wrote:
> Hi Milo,
>
> Thanks for the update. I have few comments below.
>
[...]
>> +static u8 lm3633_led_scale_max_brightness(struct ti_lmu_led *lmu_led,
>> u32 imax)
>> +{
>> +    u8 max_current = lm3633_led_convert_current_to_index(imax);
>> +    const u8 max_brightness_table[] = {
>> +        [LMU_IMAX_5mA]  = 191,
>> +        [LMU_IMAX_6mA]  = 197,
>> +        [LMU_IMAX_7mA]  = 203,
>> +        [LMU_IMAX_8mA]  = 208,
>> +        [LMU_IMAX_9mA]  = 212,
>> +        [LMU_IMAX_10mA] = 216,
>> +        [LMU_IMAX_11mA] = 219,
>> +        [LMU_IMAX_12mA] = 222,
>> +        [LMU_IMAX_13mA] = 225,
>> +        [LMU_IMAX_14mA] = 228,
>> +        [LMU_IMAX_15mA] = 230,
>> +        [LMU_IMAX_16mA] = 233,
>> +        [LMU_IMAX_17mA] = 235,
>> +        [LMU_IMAX_18mA] = 237,
>> +        [LMU_IMAX_19mA] = 239,
>> +        [LMU_IMAX_20mA] = 241,
>> +        [LMU_IMAX_21mA] = 242,
>> +        [LMU_IMAX_22mA] = 244,
>> +        [LMU_IMAX_23mA] = 246,
>> +        [LMU_IMAX_24mA] = 247,
>> +        [LMU_IMAX_25mA] = 249,
>> +        [LMU_IMAX_26mA] = 250,
>> +        [LMU_IMAX_27mA] = 251,
>> +        [LMU_IMAX_28mA] = 253,
>> +        [LMU_IMAX_29mA] = 254,
>> +        [LMU_IMAX_30mA] = 255,
>> +    };
>
> After analyzing the subject one more time I think that we need to
> change the approach regarding max brightness issue.
>
> At first - we shouldn't fix max current to max possible register value.
> Instead we should take led-max-microamp property and write its value
> to the [0x22 + bank offset] registers.

It was of course a mental shortcut. The value to write should be
calculated by transforming the formula given next to the register
documentation:

11111 = 29.8 mA
0.8mA steps, FS = 5mA + code * 0.8 mA

code is here the [0x22 + bank_offset] register value.

Effectively, the formula to calculate the register value basing
on led-max-microamp value should be:

FS = led-max-microamp - 5000 / 800

E.g. for 20.2 mA:

FS = (20200 - 5000) / 800 = 19

for 29.8 mA:

FS = (29800 - 5000) / 800 = 31

for 5 mA:

FS = (5000 - 5000) / 800 = 0

 From the above min, max and step values for led-max-microamp
are 5000, 29800 and 800 respectively. Please correct DT documentation
accordingly.

> With this approach whole 0-255 range of brightness levels will be
> valid for the driver.
>
> In effect all LMU_IMAX* enums seem to be not needed.


-- 
Best Regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
