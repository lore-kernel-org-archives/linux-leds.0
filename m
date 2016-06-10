From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Re: [PATCH v3 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Fri, 10 Jun 2016 13:56:03 +0100
Message-ID: <575AB8E3.4000401@daqri.com>
References: <1465469168-6286-1-git-send-email-tony.makkiel@daqri.com>
 <57595CE5.70905@samsung.com> <57598927.6060207@daqri.com>
 <575A79AD.2030700@samsung.com> <575AA707.8090704@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:38095 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040AbcFJM4J (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 10 Jun 2016 08:56:09 -0400
Received: by mail-wm0-f52.google.com with SMTP id m124so100904657wme.1
        for <linux-leds@vger.kernel.org>; Fri, 10 Jun 2016 05:56:09 -0700 (PDT)
In-Reply-To: <575AA707.8090704@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org




>>>>> +
>>>>> +#ifdef CONFIG_ACPI
>>>>> +static const struct acpi_device_id lp3952_acpi_match[] = {
>>>>> +    {LP3952_NAME, 0},
>>>>> +    {}
>>>>> +};
>>>>
>>>> Could you please share how did you apply ACPI overlay?
>>>
>>> I am using the initrd ACPI method of Octavian's patch.
>>>
>>> https://lkml.org/lkml/2016/3/31/333
>>
>> Thanks. Would it be possible to define entries per each LED
>> connected to the LED controller, similarly as it is in case
>> of Device Tree bindings?:
>>
>> Documentation/devicetree/bindings/leds/common.txt
>>
> 
> I am not sure. I did a quick skim through ACPI Spec 5.0.
> But couldn't find anything.

Found it!, although not relevant for this driver. Please 
see last page of
http://www.uefi.org/sites/default/files/resources/_DSD-device-properties-UUID.pdf
> 
>>>>> +
>>>>> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
>>>>> +#endif
>>>>> +
