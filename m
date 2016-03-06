From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v7 1/5] leds: core: add generic support for RGB LED's
Date: Sun, 6 Mar 2016 23:24:42 +0100
Message-ID: <56DCAE2A.1070703@gmail.com>
References: <56D9F973.8090207@gmail.com>
 <20160306205158-549-87411-mailpile@palmtree-beeroclock-net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32934 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751228AbcCFWYt (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 6 Mar 2016 17:24:49 -0500
In-Reply-To: <20160306205158-549-87411-mailpile@palmtree-beeroclock-net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Karl Palsson <karlp@tweak.net.au>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>

Am 06.03.2016 um 21:55 schrieb Karl Palsson:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> Add generic support for RGB LED's.
>>
>> Basic idea is to use enum led_brightness also for the hue and
>> saturation color components.This allows to implement the color
>> extension w/o changes to struct led_classdev.
>>
>> Select LEDS_RGB to enable building drivers using the RGB
>> extension.
>>
>> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
>> should be overridden even if the provided values are zero.
>>
>> Some examples for writing values to
>> /sys/class/leds/<xx>/brightness: (now also hex notation can be
>> used)
>>
>> 255 -> set full brightness and keep existing color if set 0 ->
>> switch LED off but keep existing color so that it can be
>> restored
>>      if the LED is switched on again later
>> 0x1000000 -> switch LED off and set also hue and saturation to
>> 0 0x00ffff -> set full brightness, full saturation and set hue
>> to 0 (red)
>>
> 
> 
> I admit I hadn't seen this earlier, and I didn't spend all day
> looking at previous attempts, but what's the motivation for
> putting all this overloaded syntax into the "brightness" file? I
> thought the point was to have a single value in each file, one of
> the references I did find was
> http://www.spinics.net/lists/linux-leds/msg02995.html Is there
> some thread where this was decided as advantageous? Surely 0-255
> for _brightness_ is what the brightness entry should do?
> 
The referenced mail thread refers to a proposed sysfs attribute
holding a list of space-separated entries. Here it's still about
one numeric value.
Advantage of the approach used now is the full backwards compatibilty.
You can still set brightness to 0..255 and only the brightness will
change (as expected). Or in other words: So far only V was supported,
now we support HSV as a superset.

> I'd like to set the rgb colour of a led (or hsv, that can be it's
> own file too) and separately ramp the brightness up and down. I
> also think it's substantially simpler and easier to use from the
> user's point of view, which is surely the place you want easy
> right?
> 
What you describe is perfectly possible with the new approach.

Regards, Heiner

> Sincerely,
> Karl Palsson
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
> 
> iQIcBAEBAgAGBQJW3Jk5AAoJEBmotQ/U1cr2fxYP/AsuQ/x8ky86S9xf9Y8UdRrk
> IC7eouBpf07RsDTv2KobRwEH69tk12zxGKmOpNZ5SY8ozVT/VDXMA8Iw/cwKL2t4
> EBWTdBhORrOlfxw0sykp4SXYSYBm9n2Z+xZGK9b/fN+2g+XCv4B+W2iDejyvAsIt
> c/eH6dGR0PvYdovEh0Tq7qAflpXRAhU0ykRR0Ydq/HrF8Xfxi+MDHC99zTRrHIsV
> rPTbPh26cxZ3zyOoUxwgPLNmm4O1BvMsghxuQXV49A95gOlRet+ewDQxBgwWabEp
> AUh3fuOl53R/ODJSqjX/JjlO4ynXWgv/9kdCF8QwPUAl13gyhilPvIdI5O3gm3Nr
> beiW/rUnvHej3ZxbRUe/Q8ZlQ099WTVH4cEgSxLclC5hiWm4dCjsjskJA1acbnZV
> 4w5WSqrAqSyNP81Rhy7WV6k8kazDUrASSAl4JFnNJVRC4WNdHQJA4pKkH08mtYyo
> 5ls3ydMzU2eiTNKCFEze4/cH3MgUWM+L29rLRzev6rT7s32rPzR0JKaKv460pocd
> rjpKanbt+zgUVySprVzX4t4GsmDZtKjQkTGooz9BabZP5+WeVvDtEMK3kciZ1d/x
> ubtvcMXGbDpZ0FMcQkTQj44Sq3wMdr3P0CoMiDspDGk7XY67gSXsmUgSSh0JTLRL
> X4K67h/OUpH0A00XGZCO
> =86mG
> -----END PGP SIGNATURE-----
> 
