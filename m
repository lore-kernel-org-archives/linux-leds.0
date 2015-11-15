From: Simon Arlott <simon@fire.lp0.eu>
Subject: leds-bcm6328: add more init configuration options
Date: Sun, 15 Nov 2015 17:27:44 +0000
Message-ID: <5648C090.9060904@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

commit 1d3ff22d633d35048c35c3deeead7ab116cebc32
Author: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
Date:   Thu Oct 8 12:35:55 2015 +0200

    Documentation: leds: update DT bindings for leds-bcm6328
   =20
    This patch adds latest DT bindings for leds-bcm6328 init register
    configuration.

commit 9f82c778ce17789a038351a411ff65cd41033c7a
Author: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
Date:   Thu Oct 8 12:35:54 2015 +0200

    leds-bcm6328: add more init configuration options
   =20
    This patch adds more init register configuration options:
    - Serial LEDs multiplexing.
    - Serial LEDs clock signal low/high polarity.
    - Serial LEDs data signal low/high polarity.
    - Serial LEDs shift direction inverted/normal.

This was not a backwards-compatible change, because the driver is now
turning off all of the serial LED options by default when previously
it only turned off brcm,serial-leds and left the other options
unchanged.

There are currently no in-tree users of this binding, so any existing
users will be broken by this change.

--=20
Simon Arlott
