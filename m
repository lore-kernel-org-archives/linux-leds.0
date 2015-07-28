From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 3/3] leds/powernv: Add driver for PowerNV platform
Date: Tue, 28 Jul 2015 08:38:33 +0200
Message-ID: <55B72369.5040102@gmail.com>
References: <1437801670-23705-1-git-send-email-hegdevasant@linux.vnet.ibm.com> <1437801670-23705-4-git-send-email-hegdevasant@linux.vnet.ibm.com> <55B5540B.1000301@gmail.com> <55B5A853.3080909@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34737 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751238AbbG1GkP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jul 2015 02:40:15 -0400
Received: by wibud3 with SMTP id ud3so166890514wib.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2015 23:40:14 -0700 (PDT)
In-Reply-To: <55B5A853.3080909@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, j.anaszewski@samsung.com, mpe@ellerman.id.au
Cc: rpurdie@rpsys.net, cooloney@gmail.com, khandual@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, stewart@linux.vnet.ibm.com, benh@kernel.crashing.org

Vasant,

I've found one more formatting issue below.

On 27.07.2015 05:41, Vasant Hegde wrote:
[...]
>>> +
>>> +/*
>>> + * This function registers classdev structure for any given type of LED on
>>> + * a given child LED device node.
>>> + */
>>> +static int powernv_led_create(struct device *dev,
>>> +                  struct powernv_led_data *powernv_led,
>>> +                  const char *led_type_desc)
>>> +{
>>> +    int rc;
>>> +
>>> +    /* Make sure LED type is supported */
>>> +    powernv_led->led_type = powernv_get_led_type(led_type_desc);
>>> +    if (powernv_led->led_type == -1) {
>>> +        dev_warn(dev, "%s: No support for led type : %s\n",
>>> +             __func__, led_type_desc);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /* Create the name for classdev */
>>> +    powernv_led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s",
>>> +                        powernv_led->loc_code,
>>> +                        led_type_desc);
>>> +    if (!powernv_led->cdev.name) {
>>> +        dev_err(dev,
>>> +            "%s: Memory allocation failed for classdev name\n",
>>> +            __func__);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    powernv_led->cdev.brightness_set = powernv_brightness_set;
>>> +    powernv_led->cdev.brightness_get = powernv_brightness_get;
>>> +    powernv_led->cdev.brightness = LED_OFF;
>>> +    powernv_led->cdev.max_brightness = LED_FULL;
>>> +
>>> +    /* Register the classdev */
>>> +    rc = devm_led_classdev_register(dev, &powernv_led->cdev);
>>> +    if (rc) {
>>> +        dev_err(dev, "%s: Classdev registration failed for %s\n",
>>> +            __func__, powernv_led->cdev.name);
>>> +    }

Braces are not needed here,

>>> +
>>> +    return rc;
>>> +}

-- 
Best Regards,
Jacek Anaszewski
