From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Mon, 12 Nov 2018 22:25:47 +0100
Message-ID: <CACRpkdZwgZ=PmX3PEpR-F76BZ5g9hzvQYc_3QfFYhHvBHqp4Tw@mail.gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd> <a640167b-3a3e-daea-b377-6e82b653c5e8@gmail.com>
 <20181111201605.GA20160@amd> <57b77d4e-39a0-aaf2-5952-c2c25dc58593@gmail.com> <e72ac342-5253-851a-e54f-b1bd752be628@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e72ac342-5253-851a-e54f-b1bd752be628@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dachaac@gmail.com
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, dmurphy@ti.com, oleg@kaa.org.ua, Sakari Ailus <sakari.ailus@linux.intel.com>, simon@lineageos.org, xiaotong.lu@spreadtrum.com
List-Id: linux-leds@vger.kernel.org

On Mon, Nov 12, 2018 at 1:02 AM Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@g=
mail.com> wrote:

> Couldn't we have here multiple variants that would then be chosen based
> on device tree definition?

It needs to be subsystem specific or something.
What you say make sense for things based on device
tree.

The problem hit me on an Intel laptop with several
USB keyboards.

OK maybe I am stupid for plugging in two USB keyboards,
but we should definately support it. Input/HID supports it
well.

Yours,
Linus Walleij
