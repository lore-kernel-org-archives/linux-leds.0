From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Thu, 15 Nov 2018 10:10:42 +0100
Message-ID: <CACRpkdZdoQbFtL-UwsZZPPGtt5NK5XUHsBBm51ZwcU0nF-W5pQ@mail.gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd> <CACRpkdYJNWC3RZXjCu+3EfRbPy6OyLLw-FivpFoe1p3ckHTCmg@mail.gmail.com>
 <90914660-6add-a4d9-0dfe-7b82a7664bd8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <90914660-6add-a4d9-0dfe-7b82a7664bd8@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, dmurphy@ti.com, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, simon@lineageos.org, xiaotong.lu@spreadtrum.com
List-Id: linux-leds@vger.kernel.org

On Tue, Nov 13, 2018 at 8:55 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

> LED core has had a protection
> against name clash since the commit:
>
> commit a96aa64cb5723d941de879a9cd1fea025d6acb1b
> Author: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Date:   Mon Mar 30 10:45:59 2015 -0700
>
>     leds/led-class: Handle LEDs with the same name

Oh neat!

I guess the sysfs clashes I have seen can have been other
stuff then, but it was a while back, I don't think it was so far
back as this patch.

Yours,
Linus Walleij
