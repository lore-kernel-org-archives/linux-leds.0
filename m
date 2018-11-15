From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/24] leds: dt-bindings: Add LED_FUNCTION definitions
Date: Thu, 15 Nov 2018 10:16:22 +0100
Message-ID: <CACRpkdb6VP5hsg8ScrfAEt7TV5k_8zf7cruNxzhwfHrkdgwyuA@mail.gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com> <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, dmurphy@ti.com, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, simon@lineageos.org, xiaotong.lu@spreadtrum.com
List-Id: linux-leds@vger.kernel.org

On Tue, Nov 6, 2018 at 11:07 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

> +#define LED_FUNCTION_DISK "disk"

I recently added triggers for "disk-read" and "disk-write".
This was because the D-Link DNS-313 does have dedicated
LEDs for each usecase, and so does DIR-685.

So I think you may need
LED_FUNCTION_DISK_READ "disk-read"
and
LED_FUNCTION_DISK_WRITE "disk-write"
to cover these cases.

Yours,
Linus Walleij
