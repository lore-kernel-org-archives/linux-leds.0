From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 4/4] leds: Replace dedicated SN3218 driver with
 IS31FL32XX driver
Date: Fri, 4 Mar 2016 22:14:27 +0100 (CET)
Message-ID: <1872003451.86198.4bb16da4-d4d8-48af-950a-7442cddf2b4d.open-xchange@email.1und1.de>
References: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
 <1456974095-1867-5-git-send-email-drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:65083 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757489AbcCDVO4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 16:14:56 -0500
In-Reply-To: <1456974095-1867-5-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>, devicetree@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Mark Rutland <mark.rutland@arm.com>

Hi David,

> "David Rivshin (Allworx)" <drivshin.allworx@gmail.com> hat am 3. M=C3=
=A4rz 2016 um
> 04:01 geschrieben:
>
>
> From: David Rivshin <drivshin@allworx.com>
>
> Si-En Technology was acquired by ISSI in 2011, and it appears that
> the IS31FL3218/IS31FL3216 are just rebranded SN3218/SN3216 devices.
> As the IS31FL32XX driver already handles the *3218 devices, there
> is no longer a need for the dedicated SN3218 driver.
>
> Add the "sn,sn3218" and "sn,sn3216" compatible strings into the
> IS31FL32XX driver and binding documentation, and remove the
> leds-sn3218 driver.
>
> Datasheets:
> IS31FL3218: http://www.issi.com/WW/pdf/31FL3218.pdf
> SN3218: http://www.si-en.com/uploadpdf/s2011517171720.pdf
>
> IS31FL3216: http://www.issi.com/WW/pdf/31FL3216.pdf
> SN3216; http://www.si-en.com/uploadpdf/SN3216201152410148.pdf
>
> Signed-off-by: David Rivshin <drivshin@allworx.com>

i tested this patch successfully with a Raspberry Pi and a PiGlow (SN32=
18).

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
