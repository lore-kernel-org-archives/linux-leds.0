From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH 0/2] usb: add HCD providers
Date: Wed, 13 Jul 2016 12:51:40 +0800
Message-ID: <20160713045140.GA29915@shlinux2>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:34891 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbcGMFAD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Jul 2016 01:00:03 -0400
Content-Disposition: inline
In-Reply-To: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org

On Tue, Jul 12, 2016 at 02:35:18PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> Hi,
>=20
> I was working on an "usbport" LED trigger driver and specifying its
> default state in DT. I realized I can't really determine numbering of
> USB ports on any device as it depends on compiled drivers and the
> loading orders.
>=20
> It means that my physical USB port can be e.g. 1-1 or 2-1 depending o=
n
> my current config/setup. I needed a way to specify a particular HCD i=
n
> DT and then hardcode port number (as this part doesn't change).
>=20

I have a question:

What does your "usbport" LED trigger for? What kinds of information
you would like to show on LED?

Peter

> These 2 patches add providers to usb core subsystem. I successfully
> tested it with "usbport" trigger and generic-ohci, generic-ehci &
> generic-xhci.
>=20
> The last (third) patch is not supposed to be applied, it's used only =
as
> a proof and example of how providers can be used.
>=20
> If there is anything wrong with this idea/implementation, please let =
me
> know.
>=20
> Rafa=C5=82 Mi=C5=82ecki (2):
>   usb: core: add support for HCD providers
>   ohci-platform: register HCD provider
>=20
>  drivers/usb/core/Makefile        |  1 +
>  drivers/usb/core/provider.c      | 79 ++++++++++++++++++++++++++++++=
++++++++++
>  drivers/usb/host/ohci-platform.c |  9 +++++
>  include/linux/usb/provider.h     | 39 ++++++++++++++++++++
>  4 files changed, 128 insertions(+)
>  create mode 100644 drivers/usb/core/provider.c
>  create mode 100644 include/linux/usb/provider.h
>=20
> --=20
> 1.8.4.5
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20

Best Regards,
Peter Chen
