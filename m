From: Javier Arteaga <javier@emutex.com>
Subject: Re: [RFC PATCH 0/3] UP Squared board drivers
Date: Sat, 21 Apr 2018 09:46:20 +0100
Message-ID: <86d9e499-2ec9-fc15-8745-951158c74a47@emutex.com>
References: <20180421083008.27411-1-javier@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180421083008.27411-1-javier@emutex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Sorry, I messed up this submission:
linux-kernel is only Cc'd on the cover letter.

I'll repost right away - please ignore this thread.

On 21/04/2018 09:30, Javier Arteaga wrote:
> Hi all,
> 
> This series adds platform support for AAEON's UP Squared, a x86 SBC
> based on Apollo Lake [1]. Specifically, it enables control for the board
> pin headers and for the LEDs, as both of these features are only
> available behind a FPGA-based platform controller.
> 
> This is structured around a MFD driver that provides a regmap interface
> to that platform controller to each MFD cell.
> 
> The series is carved out from an out-of-tree support patchset, initially
> written by Dan O'Donovan for the original UP Board [2] and then extended
> through the past year to support new entries in the lineup (UP Board, UP
> Squared and UP Core) [3].
> 
> Here we only submit support for UP Squared to simplify review. Still,
> the driver is designed so that it can easily gain support for the other
> boards.
> 
> Questions:
> 
> * Is MFD the right fit for the platform controller?
>   The intention here is to encapsulate the custom GPIO-bitbanged control
>   protocol by sharing the regmap between the drivers.
> 
> * Is our use of two chained pinctrls (in patch 3/3) valid?
> 
> Thank you!
> 
> [1]: http://www.up-board.org/upsquared/specifications-up2/
> [2]: https://lkml.kernel.org/r/1467648434-29080-1-git-send-email-dan@emutex.com
> [3]: https://github.com/emutex/ubilinux-kernel/commits/upboard-4.9
> 
> Javier Arteaga (3):
>   mfd: upboard: Add UP2 platform controller driver
>   leds: upboard: Add LED support
>   pinctrl: upboard: Add pinctrl and gpio driver
> 
>  drivers/leds/Kconfig              |  10 +
>  drivers/leds/Makefile             |   1 +
>  drivers/leds/leds-upboard.c       |  87 +++++
>  drivers/mfd/Kconfig               |  17 +
>  drivers/mfd/Makefile              |   1 +
>  drivers/mfd/upboard.c             | 273 ++++++++++++++++
>  drivers/pinctrl/Kconfig           |  13 +
>  drivers/pinctrl/Makefile          |   1 +
>  drivers/pinctrl/pinctrl-upboard.c | 523 ++++++++++++++++++++++++++++++
>  include/linux/mfd/upboard.h       |  70 ++++
>  10 files changed, 996 insertions(+)
>  create mode 100644 drivers/leds/leds-upboard.c
>  create mode 100644 drivers/mfd/upboard.c
>  create mode 100644 drivers/pinctrl/pinctrl-upboard.c
>  create mode 100644 include/linux/mfd/upboard.h
> 
