From: Tony <tony.makkiel@daqri.com>
Subject: Re: [PATCH v8 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Thu, 7 Jul 2016 15:59:44 +0100
Message-ID: <577E6E60.50804@daqri.com>
References: <1467732628-2025-1-git-send-email-tony.makkiel@daqri.com>
 <577D08C7.5000802@samsung.com> <577D1E32.50809@daqri.com>
 <577E0130.1010806@samsung.com> <577E408A.5010905@daqri.com>
 <577E688C.9080409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:37733 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751550AbcGGPAC (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Jul 2016 11:00:02 -0400
Received: by mail-wm0-f50.google.com with SMTP id a66so35442712wme.0
        for <linux-leds@vger.kernel.org>; Thu, 07 Jul 2016 07:59:47 -0700 (PDT)
In-Reply-To: <577E688C.9080409@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org



On 07/07/16 15:34, Jacek Anaszewski wrote:

>>>
>>> Why actually do you need this array? Couldn't you provide the LED
>>> identifier in the DSD entry corresponding to a LED? You can follow
>>> the scheme used in Device Tree by introducing "reg" property.
>>
>> The names in the array are the 6 identifiers in the DSD entry. For
>> example
>> the DSD property for blue2 led used is
>>
>> "Package ()
>> {
>>          Package (2) {"blue2", "led_blue2"},
>> "
>> acpi_dev_get_property will return "led_blue2" in obj->string.pointer.
>>
>> There isn't separate DSD for individual leds. There is only 1 DSD for
>> the led controller identified by "Name (_HID, "TXNW3952")". The
>> individual led names are separate properties withing th DSD (eg:
>> led_blue2 identified by blue2).
>
> OK, thanks for the explanation. BTW LED name pattern is
> devicename:colour:function.
>
>>>
>>>>>> +    for (i = 0; i < LP3952_LED_ALL; i++) {
>>>>>> +        priv->leds[i].cdev.brightness = LED_OFF;
>>>>>> +        priv->leds[i].cdev.max_brightness = LP3952_BRIGHT_MAX;
>>>>>> +        priv->leds[i].cdev.brightness_set_blocking =
>>>>>> +                lp3952_set_brightness;
>>>>>> +        priv->leds[i].channel = i;
>>>>>> +        priv->leds[i].priv = priv;
>>>>>> +
>>>>>> +        ret = lp3952_get_label(priv->leds[i].name, led_name_hdl[i],
>>>>>> +                       &priv->client->dev);
>>>>>> +        if (ret)
>>>>>> +            break;
>>>>>
>>>>> You're assuming here that all LEDs will always be present, which
>>>>> doesn't necessarily have to be true. How about just skipping
>>>>> the LED and moving to the next one if given label was not found?
>>>>> You could move this check to the beginning of the loop then.
>>>>
>>>> If we skip leds, there could be problem, if all the leds were
>>>> skipped(For example, no ACPI name data present).
>>>
>>> If all the LEDs were skipped, then no LED class device would be
>>> registered. In such a case you could return an error from
>>> lp3952_probe().
>>>
>>>>
>>>> At present, if a label is not present, the probe will fail.
>>>> How about reverting to a default name (eg: "lp3952:blue2") if led name
>>>> read fails?
>>>
>>> There is no point in registering the LED if its DSD entry is not
>>> valid. In case of Device Tree we fail LED registration in such
>>> cases.
>>
>> Sorry, I thought we were skipping LEDs due to invalid DSD. If that is
>> not the case, isn't the assumption all LEDS will be present true?
>> I am guessing leds might be missing, if some of the leds are not
>> physically connected to controller output. But the controller would
>> have 6 led controls all the time.
>
> Right, but there is no point in exposing corresponding
> LED class devices to user space if the user will be unable
> to notice any effect because the LED is not connected.

Got it, Thank you :) Will skip registration if led not found.
>
>>>
>>>> This would also cover cases in which none of the led names
>>>> were read properly.
>>>
>>> Whole driver probing should fail then.
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +        priv->leds[i].cdev.name = priv->leds[i].name;
>>>>>> +
>>>>>> +        ret = devm_led_classdev_register(&priv->client->dev,
>>>>>> +                         &priv->leds[i].cdev);
>>>>>> +        if (ret < 0) {
>>>>>> +            dev_err(&priv->client->dev,
>>>>>> +                "couldn't register LED %s\n",
>>>>>> +                priv->leds[i].cdev.name);
>>>>>> +            break;
>>>>>> +        }
>>>>>> +    }
>>>>>> +    return ret;
>>>>>> +}
>>>>>> +
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>> linux-acpi" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>>
>>>
>>>
>>
>>
>
>
