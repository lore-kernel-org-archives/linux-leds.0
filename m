From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v8 0/7] platform/x86: Notify userspace about hotkeys
 changing kbd-backlight brightness
Date: Thu, 2 Mar 2017 15:22:53 +0100
Message-ID: <20170302142253.GC29684@pali>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <CAHp75VfMyp9XzG6w0H60JhxpdRYfv5NuO-T9ZevPc4KT19fbGw@mail.gmail.com>
 <98a12674-9763-670b-5978-c4150162cd79@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <98a12674-9763-670b-5978-c4150162cd79@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thursday 02 March 2017 15:12:52 Hans de Goede wrote:
> Hi,
> 
> On 02-03-17 00:10, Andy Shevchenko wrote:
> >On Thu, Feb 9, 2017 at 5:44 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> >>Here is v8 of the platform drivers changes matching / using the new
> >>v8 LED subsys led_classdev_notify_brightness_hw_changed() functionality
> >>queued in -next.
> >>
> >>There have been some changes (and preparation patches added) compared
> >>to the previous versions since the new LED api requires the driver to
> >>only call led_classdev_notify_brightness_hw_changed() on hotkey triggered
> >>changes and the ACPI events indicating brightness changes also get
> >>triggered when setting the brightness to led_set_brightness (or sysfs).
> >>
> >>This series depends on the patch adding
> >>led_classdev_notify_brightness_hw_changed() to the LED subsystem,
> >>Jacek can you create a stable branch with just that patch which the
> >>platform/x86 platform maintainers can merge, so that they can apply
> >>this series ?
> >
> >I briefly read the discussion and looks like I'll wait for v9 after
> >merge window is closed.
> 
> Ok.
> 
> Note the 3 acpi-thinkpad patches have been in
> linux-platform-drivers-x86.git/testing for a while now and there has been
> no discussion surrounding those. Do you want me to send a v9 of those too,
> or just the Dell driver patches ?

If we all agree on change for Dell driver to just drop one event, maybe
we can discuss if similar approach should be used also for Thinkpad
driver...

> Regards,
> 
> Hans

-- 
Pali Rohár
pali.rohar@gmail.com
