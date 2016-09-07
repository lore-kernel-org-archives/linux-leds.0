From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Creating sysfs brightness for every led channels
Date: Wed, 7 Sep 2016 22:27:21 +0200
Message-ID: <094425d1-4e0f-f702-4d57-94c21ca75217@gmail.com>
References: <CAEwN+MAKgvtdB-tgoxzwAZgUk9rUp+YFaCY7qbKk4sg87zdDYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34950 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751372AbcIGU2A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Sep 2016 16:28:00 -0400
Received: by mail-wm0-f52.google.com with SMTP id w12so1295601wmf.0
        for <linux-leds@vger.kernel.org>; Wed, 07 Sep 2016 13:27:59 -0700 (PDT)
In-Reply-To: <CAEwN+MAKgvtdB-tgoxzwAZgUk9rUp+YFaCY7qbKk4sg87zdDYQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Raul Piper <raulpblooper@gmail.com>, linux-leds@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi Raul,

On 09/05/2016 08:32 PM, Raul Piper wrote:
> Hi,
> I am trying to send the brightness value ( for 5 channels) by
>  echo "val1val2val3val4val5" > brightness ,

How did you infer this format?

Please get acquainted with Documentation/leds/leds-class.txt
and Documentation/ABI/testing/sysfs-class-led.

> But seems like even if I change the brightness type to enum or int in
> my driver ,I will never be able to send the brightness string because
> led class defines the brightness value as enum.

One LED class device can control one channel.

>
> extern void led_set_brightness(struct led_classdev *led_cdev,
> enum led_brightness brightness);
>
> Only possible way I am finding is to create attributes for each
> channel like brightness,default trigger,max_brightness and any user
> defined attributes, but i am not getting how to do this.
> Can some on please comment or post the link to the example driver.
> Do i have to call led_class_register for every channel and I have to
> define every channel in the device tree?

Just grep through drivers/leds and Documentation/devicetree/bindings/leds/.

-- 
Best regards,
Jacek Anaszewski
