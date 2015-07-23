From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v7 3/3] leds/powernv: Add driver for PowerNV platform
Date: Thu, 23 Jul 2015 14:26:14 +0200
Message-ID: <55B0DD66.8090809@gmail.com>
References: <1437576767-28496-1-git-send-email-hegdevasant@linux.vnet.ibm.com> <1437576767-28496-4-git-send-email-hegdevasant@linux.vnet.ibm.com> <55B09DFB.2080108@gmail.com> <55B0A0E1.1090803@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:35583 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752316AbbGWM1t (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2015 08:27:49 -0400
Received: by wibxm9 with SMTP id xm9so206072660wib.0
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2015 05:27:48 -0700 (PDT)
In-Reply-To: <55B0A0E1.1090803@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, j.anaszewski@samsung.com
Cc: stewart@linux.vnet.ibm.com, arnd@arndb.de, j.anaszewski81@gmail.com, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

Vasant,

On 23.07.2015 10:08, Vasant Hegde wrote:
> On 07/23/2015 01:25 PM, Jacek Anaszewski wrote:
>> Hi Vasant,
>>
>
> Jacek,
>
> .../...
>
>>> +/* PowerNV LED data */
>>> +struct powernv_led_data {
>>> +    struct led_classdev    cdev;
>>> +    char            *loc_code;    /* LED location code */
>>> +    int            led_type;    /* OPAL_SLOT_LED_TYPE_* */
>>> +    enum led_brightness    value;        /* Brightness value */
>>
>> You don't need 'value' as brightness value is already stored in
>> cdev.brightness.
>>
>
> Agree. I'll remove.
>
>>> +/*
>>> + * LED classdev 'brightness_get' function. This schedules work
>>> + * to update LED state.
>>> + */
>>> +static void powernv_brightness_set(struct led_classdev *led_cdev,
>>> +                   enum led_brightness value)
>>> +{
>>> +    struct powernv_led_data *powernv_led =
>>> +        container_of(led_cdev, struct powernv_led_data, cdev);
>>> +
>>> +    /* Do not modify LED in unload path */
>>> +    if (led_disabled)
>>> +        return;
>>> +
>>> +    /* Prepare the request */
>>> +    powernv_led->value = value;
>>> +
>>> +     return powernv_led_set(powernv_led);
>>
>> Isn't mutex_lock/unlock missing here?
>
> Yes. I realized this after sending out the patch. I will fix this.
> .../...
>
>>> +
>>> +    max_led_type = devm_kzalloc(dev, sizeof(*max_led_type), GFP_KERNEL);
>>> +    if (!max_led_type)
>>> +        return -ENOMEM;
>>> +
>>> +    mutex_init(lock);
>>> +    *max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
>>> +
>>> +    platform_set_drvdata(pdev, lock);
>>
>> Setting only lock as drvdata looks odd to me and I haven't noticed
>> anyone doing that.
>> I'd prefer to put lock, led_disabled and max_led_type in a common
>> struct and set it as drvdata. I know that I accepted this design, but
>> I didn't take into account these details.
>
> Yeah. Even I looked into existing code and I don't see anyone using like this.
> Since it's void * and we just need lock, I added like this.
>
> If I break this into two structure, then I've to use platform_get_drvdata() call
> in multiple functions like powernv_brightness_set() to get max_let_type etc. Is
> that fine?

You could add wrappers for grouping instructions required to
retrieve given properties of the common struct.
Alternatively you could add a pointer to the common struct
in the struct powernv_led_data. You can play with these approaches
and choose the one which looks better.

-- 
Best Regards,
Jacek Anaszewski
