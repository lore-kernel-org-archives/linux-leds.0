From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 22:42:04 +0200
Message-ID: <CACna6rxK_9r=i5Wb7r55MmzXs04AVGv4-D5z-UhVdaptpMUO2g@mail.gmail.com>
References: <20160823220404.9887-1-zajec5@gmail.com> <20160824175345.7033-1-zajec5@gmail.com>
 <87zio2ypel.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35357 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932499AbcHXUmG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Aug 2016 16:42:06 -0400
In-Reply-To: <87zio2ypel.fsf@miraculix.mork.no>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On 24 August 2016 at 20:48, Bj=C3=B8rn Mork <bjorn@mork.no> wrote:
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:
>
>> The last big missing thing is Documentation update (this is why I'm
>> sending RFC). Greg pointed out we should have some entries in
>> Documentation/ABI, but it seems none of triggers have it.
>
> There's a lot missing, but there is at least one exception:
> The "inverted" attribute of the  gpio and backlight triggers is
> documented as part of Documentation/ABI/testing/sysfs-class-led
>
>> Any idea why is that?
>
> Manual enforcement fails from time to time? The requirement was less
> strict in the early days of sysfs? Does it matter?
>
>> Do we need to change it? Or is it required for new code only?
>
> The lack of ABI docs is a bug. Don't add new code with known bugs. Old
> code should be fixed, but there is no immediate *need* to fix it.

Don't get me wrong. I care about code quality and documentation. I
mean to follow kernel rules. It's just some things may be not clear to
ppl and it would be nice to get any explanation/help. That said thanks
a lot of your e-mail, I'll try to expand pointed Documentation.

--=20
Rafa=C5=82
