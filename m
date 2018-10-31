From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/3] pinctrl: upboard: Add UP2 pinctrl and gpio driver
Date: Wed, 31 Oct 2018 22:30:20 +0100
Message-ID: <CACRpkdajUt7Brrf9jCOhEvrzvx24A8tp1NpGKuDPi_0uh5++eg@mail.gmail.com>
References: <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1541018689-20625-1-git-send-email-dan@emutex.com> <1541018689-20625-4-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541018689-20625-4-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-leds@vger.kernel.org, carlos.iglesias@emutex.com
List-Id: linux-leds@vger.kernel.org

Hi Dan,

On Wed, Oct 31, 2018 at 9:45 PM Dan O'Donovan <dan@emutex.com> wrote:

> The UP2 board features a Raspberry Pi compatible pin header (HAT) and a
> board-specific expansion connector (EXHAT). Both expose assorted
> functions from either the SoC (such as GPIO, I2C, SPI, UART...) or other
> on-board devices (ADC, FPGA IP blocks...).
>
> These lines are routed through an on-board FPGA. The platform controller
> in its stock firmware provides register fields to change:
>
> - Line enable (FPGA pins enabled / high impedance)
> - Line direction (SoC driven / FPGA driven)
>
> To enable using SoC GPIOs on the pin header, this arrangement requires
> both configuring the platform controller, and updating the SoC pad
> registers in sync.
>
> Add a frontend pinctrl/GPIO driver that registers a new set of GPIO
> lines for the header pins. When these are requested, the driver
> propagates this request to the backend SoC pinctrl/GPIO driver by
> grabbing a GPIO descriptor for the matching SoC GPIO line. The needed
> mapping for this is retrieved via ACPI properties.
>
> Signed-off-by: Dan O'Donovan <dan@emutex.com>

It appears you missed my review comments so please read them
and reply or respin the patch accordingly.

Yours,
Linus Walleij
