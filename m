From: Bryan Wu <cooloney@gmail.com>
Subject: Re: LED: inform userspace about brightness change
Date: Tue, 6 Jan 2015 09:55:41 -0800
Message-ID: <CAK5ve-Ky=8JHs=d3FtYjk46O9uVUGKsfZ3cLwX-h3FckEpmT_g@mail.gmail.com>
References: <201412242106.09959@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201412242106.09959@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Darren Hart <dvhart@infradead.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, platform-driver-x86@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Dec 24, 2014 at 12:06 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com=
> wrote:
> Hello!
>
> What is preferred way from kernel driver to inform userspace
> about LED device brightness change? In /sys/class/leds/<device>/
> is file brightness which can be used to read current brightness
> or set write new value. But sometimes also firmware (or device)
> can change value on its own and thus userspace software which
> provides slider for setting brightness will be incorrect.
>
> For example on Dell laptops there is driver which support setting
> and reading keyboard backlight (via leds kernel interface). But
> firmware/BIOS can change brightness (when something happen) and
> it can inform running system about this change via ACPI/WMI event
> interface. But how to use kernel led interface to inform userpace
> about this change? It is possible?
>

Sorry for the delay, actually I don't find any possible existing way
to send brightness change event from LED subsystem to user space.

I think we can add an udev event in set_brightness API, then when we
change the brightness, it will send out udev event to user space.

Thanks,
-Bryan
