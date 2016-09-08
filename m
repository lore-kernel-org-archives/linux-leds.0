From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Creating sysfs brightness for every led channels
Date: Thu, 8 Sep 2016 21:17:18 +0200
Message-ID: <c8e8f7bd-5a7a-c663-bcc1-eb5b7a34af29@gmail.com>
References: <CAEwN+MAKgvtdB-tgoxzwAZgUk9rUp+YFaCY7qbKk4sg87zdDYQ@mail.gmail.com>
 <094425d1-4e0f-f702-4d57-94c21ca75217@gmail.com>
 <CAEwN+MBdfu+n60U6J-prhCzETV=NJDC3Zfs3dGJTL9HFhj_2Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37124 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941093AbcIHTR6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Sep 2016 15:17:58 -0400
Received: by mail-wm0-f53.google.com with SMTP id w12so107067720wmf.0
        for <linux-leds@vger.kernel.org>; Thu, 08 Sep 2016 12:17:58 -0700 (PDT)
In-Reply-To: <CAEwN+MBdfu+n60U6J-prhCzETV=NJDC3Zfs3dGJTL9HFhj_2Kw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Raul Piper <raulpblooper@gmail.com>
Cc: kernelnewbies <kernelnewbies@kernelnewbies.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On 09/08/2016 12:56 PM, Raul Piper wrote:
> On Thu, Sep 8, 2016 at 1:57 AM, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> Hi Raul,
>>
>> On 09/05/2016 08:32 PM, Raul Piper wrote:
>>>
>>> Hi,
>>> I am trying to send the brightness value ( for 5 channels) by
>>>  echo "val1val2val3val4val5" > brightness ,
>>
>>
>> How did you infer this format?
>  Val1 is for channel #1 brightness, Val2 is for channel #2 .I un-parse
> it in the _set_brightness_ method , but as written I think I have to
> create a separate brightness sysfs for each channel. Thankyou for the
> example documentation.
>
> But what if I want to change the brightness of all the channels
> simultaneously?Is it supported?
> Is the Brightness sysfs implementation guaranteed to change the
> brightness of the leds as soon as it is written by some user space
> script.Can we not just store the values every time a channel is
> written with the brightness value and then sync all the brightness by
> some other sysfs(custom) with all those values.- In case of
> simultaneous brightness change?

This is the problem that emerges from time to time. We've had few
discussions about it. The last one took place few months ago,
when we were trying to merge generic support for RGB LEDs:

http://www.spinics.net/lists/linux-leds/msg05938.html

We've even managed to agree on possible solution to the problem
but nobody was eager to take the chance and implement it. Maybe you
will be the one ? :)

>> Please get acquainted with Documentation/leds/leds-class.txt
>> and Documentation/ABI/testing/sysfs-class-led.
>>
>>> But seems like even if I change the brightness type to enum or int in
>>> my driver ,I will never be able to send the brightness string because
>>> led class defines the brightness value as enum.
>>
>>
>> One LED class device can control one channel.
>>
>>>
>>> extern void led_set_brightness(struct led_classdev *led_cdev,
>>> enum led_brightness brightness);
>>>
>>> Only possible way I am finding is to create attributes for each
>>> channel like brightness,default trigger,max_brightness and any user
>>> defined attributes, but i am not getting how to do this.
>>> Can some on please comment or post the link to the example driver.
>>> Do i have to call led_class_register for every channel and I have to
>>> define every channel in the device tree?
>>
>>
>> Just grep through drivers/leds and Documentation/devicetree/bindings/leds/.
> Thank-you for this.
>> --
>> Best regards,
>> Jacek Anaszewski
>
> Thanks and Regards,
> Rp
>

-- 
Best regards,
Jacek Anaszewski
