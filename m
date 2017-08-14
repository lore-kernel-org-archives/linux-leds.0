From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 0/4] leds: pca955x: add GPIO support
Date: Mon, 14 Aug 2017 22:28:21 +0200
Message-ID: <7540672f-7944-9346-3d0d-491b6659e3a0@gmail.com>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37530 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752120AbdHNU3F (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Aug 2017 16:29:05 -0400
In-Reply-To: <1502199760-763-1-git-send-email-clg@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>

Hi Cedric,

Thanks for the updated set.

Applied.

Best regards,
Jacek Anaszewski

On 08/08/2017 03:42 PM, Cédric Le Goater wrote:
> Hello !
> 
> The PCA955x family of chips are I2C LED blinkers whose pins not used
> to control LEDs can be used as general purpose I/Os (GPIOs).
> 
> The following adds support for device tree and Open Firmware to be
> able do define different operation modes for each pin. See bindings
> documentation for more details. The pca955x driver is then extended
> with a gpio_chip when pins are operating in GPIO mode.
> 
> The driver follows the scheme of the leds-pca9532 driver which behaves
> quite similarly.
>  
> Thanks,
> 
> C.
> 
> Changes since v2:
> 
>  - removed 'if (pdata)' tests
> 
> Changes since v1:
> 
>  - split the patchset in two : DT support and GPIO support
>  - introduced the use of devm_led_classdev_register()
>  - replaced the 'compatible' property with 'type' 
>  - removed the 'gpio-base' property
> 
> Cédric Le Goater (4):
>   leds: pca955x: add device tree support
>   leds: pca955x: use devm_led_classdev_register
>   leds: pca955x: add GPIO support
>   dt-bindings leds: add pca955x
> 
>  .../devicetree/bindings/leds/leds-pca955x.txt      |  88 +++++++
>  drivers/leds/Kconfig                               |  11 +
>  drivers/leds/leds-pca955x.c                        | 254 +++++++++++++++++----
>  include/dt-bindings/leds/leds-pca955x.h            |  16 ++
>  4 files changed, 323 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
>  create mode 100644 include/dt-bindings/leds/leds-pca955x.h
> 
