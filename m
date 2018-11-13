From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Tue, 13 Nov 2018 20:55:24 +0100
Message-ID: <90914660-6add-a4d9-0dfe-7b82a7664bd8@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd>
 <CACRpkdYJNWC3RZXjCu+3EfRbPy6OyLLw-FivpFoe1p3ckHTCmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYJNWC3RZXjCu+3EfRbPy6OyLLw-FivpFoe1p3ckHTCmg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, dmurphy@ti.com, oleg@kaa.org.ua, Sakari Ailus <sakari.ailus@linux.intel.com>, simon@lineageos.org, xiaotong.lu@spreadtrum.com
List-Id: linux-leds@vger.kernel.org

On 11/12/2018 10:23 PM, Linus Walleij wrote:
> On Sun, Nov 11, 2018 at 1:03 PM Pavel Machek <pavel@ucw.cz> wrote:
> 
>>> -"devicename:colour:function"
>>> +"colour:function"
>>
>> I don't think we want to do it in all cases.
>>
>> So, on my cellphone seeing lp5523:green:led is indeed not useful.
>>
>> But on notebook with usb keyboard attached, you need to keep the
>> devicename to be able to distinguish capslock on internal keyboard and
>> capslock on first USB keyboard and capslock on second USB keyboard.
> 
> I agree with Pavel.
> 
> I ran into this when connecting two identical keyboards to the
> same machine. The driver worked fine up until it tries
> to create two sysfs entries with the same name for capslock.
> BOOM!

What kernel version did you use? LED core has had a protection
against name clash since the commit:

commit a96aa64cb5723d941de879a9cd1fea025d6acb1b
Author: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Mon Mar 30 10:45:59 2015 -0700

    leds/led-class: Handle LEDs with the same name

    The current code expected that every LED had an unique name. This is a
    legit expectation when the device tree can no be modified or extended.
    But with device tree overlays this requirement can be easily broken.

    This patch finds out if the name is already in use and adds the suffix
    _1, _2... if not.

    Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
    Signed-off-by: Bryan Wu <cooloney@gmail.com>


> In this case I suggest "serialnumber:color:capslock" and
> similar.
> 
> The important point is the string must be unique for each
> plugged device.

-- 
Best regards,
Jacek Anaszewski
