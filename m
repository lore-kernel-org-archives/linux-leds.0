From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFD] Sharing GPIOs for input (buttons) and output (LEDs)
Date: Tue, 22 Mar 2016 15:18:17 +0100
Message-ID: <CACRpkdZ=Xd3_T7paMif10P1zwOT5+p-qn_i1pYoUfvX1wi=EVQ@mail.gmail.com>
References: <CAMuHMdWbpj=ZnFqh1uWZSCojvrM+NB=Bbzw=UebodTr+vAKy7g@mail.gmail.com>
	<CACRpkdb1J+-_9szuv6xWhrD7+NFeCjug+cqaYsHDYyLUYbLw1w@mail.gmail.com>
	<56F14FC2.8060804@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <56F14FC2.8060804@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Mar 22, 2016 at 2:59 PM, Vaibhav Hiremath
<vaibhav.hiremath@linaro.org> wrote:
> On Thursday 17 March 2016 03:48 PM, Linus Walleij wrote:

> but recently I came across another usecase of shared gpio,
>
> Say, for example, we have multiple external I2C peripheral which share
> interrupt line over gpio (ofcourse irq line is muxed onto single gpio).
>
> Now in kernel I would have multiple instances of driver supporting each
> peripheral but gpio can not be shared for registering irq.
>
> Do you suggest MFD driver for such simple usecases ? Should gpiolib
> support SHARED gpios, and gpiolib can define all the policies over
> configuration

I don't see why you would want to use MFD at all.

Not shared GPIOs but shared interrupt lines.

If you're using device tree is is pretty straight forward:

- Make sure the GPIOlib and irqchip portions of the driver
  are totally orthogonal. (See Documentation/gpio/driver.txt
  section "GPIO drivers providing IRQs")

- Just use the irqchip side of the GPIO

- Make sure your consumers check if the IRQ is theirs
  and return IRQ_HANDLED vs NO_IRQ depending on
  whether it's theirs or not.

It is quite obvious from context that in this case all consumers
are using an open drain (if active low) scheme. However
since the GPIO is then used as input it has no effect, it is
more a question for the consumers to assure their IRQ
logic is not using push-pull but rather open drain or you will
get a disaster in the totempole...

> (input only, what about conflicts, bidirectional mode?)

We thought about this, see Documentation/gpio/driver.txt section
Locking IRQ usage".

When the line is locked for IRQ usage, it cannot be switched to
output.

Yours,
Linus Walleij
