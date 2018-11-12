From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Mon, 12 Nov 2018 22:23:13 +0100
Message-ID: <CACRpkdYJNWC3RZXjCu+3EfRbPy6OyLLw-FivpFoe1p3ckHTCmg@mail.gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com> <20181111120234.GA28794@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111120234.GA28794@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, dmurphy@ti.com, oleg@kaa.org.ua, Sakari Ailus <sakari.ailus@linux.intel.com>, simon@lineageos.org, xiaotong.lu@spreadtrum.com
List-Id: linux-leds@vger.kernel.org

On Sun, Nov 11, 2018 at 1:03 PM Pavel Machek <pavel@ucw.cz> wrote:

> > -"devicename:colour:function"
> > +"colour:function"
>
> I don't think we want to do it in all cases.
>
> So, on my cellphone seeing lp5523:green:led is indeed not useful.
>
> But on notebook with usb keyboard attached, you need to keep the
> devicename to be able to distinguish capslock on internal keyboard and
> capslock on first USB keyboard and capslock on second USB keyboard.

I agree with Pavel.

I ran into this when connecting two identical keyboards to the
same machine. The driver worked fine up until it tries
to create two sysfs entries with the same name for capslock.
BOOM!

In this case I suggest "serialnumber:color:capslock" and
similar.

The important point is the string must be unique for each
plugged device.

Yours,
Linus Walleij
