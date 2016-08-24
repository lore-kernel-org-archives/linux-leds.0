From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 20:48:02 +0200
Message-ID: <87zio2ypel.fsf@miraculix.mork.no>
References: <20160823220404.9887-1-zajec5@gmail.com>
        <20160824175345.7033-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160824175345.7033-1-zajec5@gmail.com> (=?utf-8?Q?=22Rafa?=
 =?utf-8?Q?=C5=82_Mi=C5=82ecki=22's?=
        message of "Wed, 24 Aug 2016 19:52:56 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:

> The last big missing thing is Documentation update (this is why I'm
> sending RFC). Greg pointed out we should have some entries in
> Documentation/ABI, but it seems none of triggers have it.

There's a lot missing, but there is at least one exception:
The "inverted" attribute of the  gpio and backlight triggers is
documented as part of Documentation/ABI/testing/sysfs-class-led

> Any idea why is that?

Manual enforcement fails from time to time? The requirement was less
strict in the early days of sysfs? Does it matter?

> Do we need to change it? Or is it required for new code only?

The lack of ABI docs is a bug. Don't add new code with known bugs. Old
code should be fixed, but there is no immediate *need* to fix it.


Bj=C3=B8rn
