From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/3] mfd: upboard: Add UP2 platform controller driver
Date: Thu, 1 Nov 2018 08:07:12 +0000
Message-ID: <20181101080712.GB15973@dell>
References: <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1541018689-20625-1-git-send-email-dan@emutex.com>
 <1541018689-20625-2-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541018689-20625-2-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Wed, 31 Oct 2018, Dan O'Donovan wrote:

> UP Squared (UP2) is a x86 SBC from AAEON based on Intel Apollo Lake. It
> features a MAX 10 FPGA that routes lines from both SoC and on-board
> devices to two I/O headers:
> 
>                                 +------------------------+
>                                 | 40-pin RPi-like header |
>                          +------|         (HAT)          |
>                          |      +------------------------+
>     +-------+    +--------+
>     |       |    |        |     +------------------------+
>     |  SoC  |----|  FPGA  |-----|  Custom UP2 pin header |
>     |       |    |        |     |        (EXHAT)         |
>     +-------+    +--------+     +------------------------+
>                          |
>                          +------* On-board devices: LED, VLS...
> 
> This is intended to enable vendor-specific applications to customize I/O
> header pinout, as well as include low-latency functionality. It also
> performs voltage level translation between the SoC (1.8V) and HAT header
> (3.3V).
> 
> Out of the box, this block implements a platform controller with a
> GPIO-bitbanged control interface. It's enumerated by ACPI and provides
> registers to control:
> 
> - Configuration of all FPGA-routed header lines. These can be driven
>   SoC-to-header, header-to-SoC or set in high impedance.
> 
> - On-board LEDs and enable lines for other platform devices.
> 
> Add core support for this platform controller as a MFD device, exposing
> these registers as a regmap.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dan O'Donovan <dan@emutex.com>
> ---
>  drivers/mfd/Kconfig         |  17 +++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/upboard.c       | 336 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/upboard.h |  44 ++++++
>  4 files changed, 398 insertions(+)
>  create mode 100644 drivers/mfd/upboard.c
>  create mode 100644 include/linux/mfd/upboard.h

Looks like you've ignored the review comments here too.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
