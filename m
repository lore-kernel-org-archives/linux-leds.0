From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 2/2] leds: lm3601x: Introduce the lm3601x LED driver
Date: Thu, 17 May 2018 23:26:45 +0200
Message-ID: <f8147f95-b7e3-4a78-90d7-59888b20fd60@gmail.com>
References: <20180515154352.20263-1-dmurphy@ti.com>
 <20180515154352.20263-2-dmurphy@ti.com>
 <CAHp75VegjkiiD1qTGpi9rr6cg=72t9kSwDrG=sUpUWFVO58M4A@mail.gmail.com>
 <08dda10d-f865-9cf2-b9a5-c79cbab5da98@ti.com>
 <CAHp75Vcz08zrs3bgMFcvYwRrN_A43D=Nvt5cFDQf8m9whB=yhA@mail.gmail.com>
 <f46e4b54-c463-6ef0-4155-a5dfb9dc4c2b@gmail.com>
 <52380a68-9e33-f52a-134d-5d4a928b5383@ti.com>
 <f155e9da-e41d-1201-a9f9-c321654be42e@ti.com>
 <54dcb6cc-7765-f64c-33fd-2920f3865153@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54dcb6cc-7765-f64c-33fd-2920f3865153@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Dan,

On 05/17/2018 04:34 PM, Dan Murphy wrote:
> Jacek
> 
> On 05/16/2018 04:17 PM, Dan Murphy wrote:
> <snip>
> 
>>>>>
>>>>>
>>>>>>>> +               if (!ret)
>>>>>>>
>>>>>>> if (ret) sounds more natural. And better just to split
>>>>>>>
>>>>>>>> +                       snprintf(led->led_name, sizeof(led->led_name),
>>>>>>>> +                               "%s:%s", led->led_node->name, name);
>>>>>>>> +               else
>>>>>>>> +                       snprintf(led->led_name, sizeof(led->led_name),
>>>>>>>> +                               "%s:torch", led->led_node->name);
>>>>>>>
>>>>>>> const char *tmp;
>>>>>>>
>>>>>>> ret = device_property_read_...(&tmp);
>>>>>>> if (ret)
>>>>>>>    tmp = ...
>>>>>>> sprintf(...);
>>>>
>>>> We're no longer taking devicename section of a LED class device name
>>>> from DT, so it will look differently anyway.
>>>>
> 
> So in adding the device_property code I think we again are reaching the LED label issue.
> In ARM with DT we would take the parent device node name and append it to the label

AFAIR this approach (parent DT node name used for devicename ) was 
incidentally applied in leds-as3645a.c. Soon after that we started
to use led-controller for parent DT name, according to Rob's request.

In the most of LED class drivers this is a child DT node which is used
for devicename, in case label is absent.

> if the optional label property was not available.  In migrating to the device_property
> APIs we don't or can't depend on that parent node anymore.
> 
> So for the case where the label property does not exist should we use a hard coded name
> or should we try to use the name from a device_id table.
> 
> This is how we did this for the leds-lp8860 driver.  If the label did not exist we used the
> i2c_device_id table and pulled the string from there.

i2c_device_id can't be applied as a generic pattern, but only for I2C
hooked devices. Nonetheless since it allows to save few lines of code
in case of drivers supporting a family of chips we can use it.

We are going to get rid of a devicename section from LED class device
name soon anyway, since it is redundant.

-- 
Best regards,
Jacek Anaszewski
