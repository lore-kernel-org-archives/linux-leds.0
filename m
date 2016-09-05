From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Mon, 5 Sep 2016 11:28:41 +0200
Message-ID: <CACna6rzKfhg=CcCoWFiR2rq=s2ghZgW3Y3NWN89YrNo=3=pqjw@mail.gmail.com>
References: <fd6a12b6-334d-98c6-4492-ba36474d6b22@gmail.com> <Pine.LNX.4.44L0.1609032022470.11709-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33719 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932192AbcIEJ2n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Sep 2016 05:28:43 -0400
In-Reply-To: <Pine.LNX.4.44L0.1609032022470.11709-100000@netrider.rowland.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On 4 September 2016 at 02:24, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Sat, 3 Sep 2016, Jacek Anaszewski wrote:
>
>> >> The remaining issue is the sysfs interface design for defining and
>> >> presenting multiple USB ports. I'm still in favour of a single
>> >> attribute with space separated list. This scheme is commonly used
>> >> in existing interfaces.
>> >
>> > No such interface is needed if you do things the way I outlined above.
>> > Each trigger would require the user to specify either one port, one
>> > hub, or nothing at all.  Multiple ports would not be used.
>>
>> The patch assumes that it is possible to register trigger for many
>> ports.
>
> The patch could be changed to remove that assumption.

I did this assumption for a reason. There are many devices with more
than 1 USB port and these ports are handled by the same controllers,
just different ports. Let me share USB details of my SmartRG SR400ac
device with 2 physical USB ports:

Physical USB 3.0 port is handled by following controllers and their
root hub ports:
1) OHCI's port 1
2) EHCI's port 1
3) XHCI's port 1

Physical USB 2.0 port is handled by following controllers and their
root hub ports:
1) OHCI's port 2
2) EHCI's port 2


This devices has 3 separated LEDs. I'll list them and tell which ports
should be assigned to them:

bcm53xx:green:usb3 should have assigned:
1) OHCI's port 1
2) EHCI's port 1

bcm53xx:white:usb3 should have assigned:
1) XHCI's port 1

bcm53xx:white:usb2 should have assigned:
1) OHCI's port 2
2) EHCI's port 2


As you can see, I need to specify ports precisely. Assigning a single
port is not enough. Assigning whole hub is too much. So none of:
>         echo usb1-4.2 >/sys/class/led/foo/trigger
>         echo hub1-4 >/sys/class/led/foo/trigger
>         echo usb >/sys/class/led/foo/trigger
would be sufficient here :(

--=20
Rafa=C5=82
