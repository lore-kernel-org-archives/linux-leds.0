From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 0/7] platform/x86: Notify userspace about hotkeys
 changing kbd-backlight brightness
Date: Thu, 2 Mar 2017 17:27:10 +0200
Message-ID: <CAHp75Vf9F6R9SdB+zFrBE7018hohe+7ZeTGZiMmL-Rka3pdp9A@mail.gmail.com>
References: <20170209154417.19040-1-hdegoede@redhat.com> <CAHp75VfMyp9XzG6w0H60JhxpdRYfv5NuO-T9ZevPc4KT19fbGw@mail.gmail.com>
 <98a12674-9763-670b-5978-c4150162cd79@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36815 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753130AbdCBPfA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Mar 2017 10:35:00 -0500
In-Reply-To: <98a12674-9763-670b-5978-c4150162cd79@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Mar 2, 2017 at 4:12 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> On 02-03-17 00:10, Andy Shevchenko wrote:
>> On Thu, Feb 9, 2017 at 5:44 PM, Hans de Goede <hdegoede@redhat.com> wrote:

>> I briefly read the discussion and looks like I'll wait for v9 after
>> merge window is closed.

> Note the 3 acpi-thinkpad patches have been in
> linux-platform-drivers-x86.git/testing for a while now and there has been
> no discussion surrounding those. Do you want me to send a v9 of those too,
> or just the Dell driver patches ?

Thinkpad patches have nothing to prevent them going for-next.
Thus, just Dell related.

-- 
With Best Regards,
Andy Shevchenko
